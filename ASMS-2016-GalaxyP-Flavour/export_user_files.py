import sys
import os
import shutil
import subprocess

if len( sys.argv ) == 2:
    PG_DATA_DIR_DEFAULT = sys.argv[1]
else:
    PG_DATA_DIR_DEFAULT = "/var/lib/postgresql/9.3/main"
PG_DATA_DIR_HOST = os.environ.get("PG_DATA_DIR_HOST", "/export/postgresql/9.3/main/")
PG_CONF = '/etc/postgresql/9.3/main/postgresql.conf'


def change_path( src ):
    """
        src will be copied to /export/`src` and a symlink will be placed in src pointing to /export/
    """
    if os.path.exists( src ):
        dest = os.path.join( '/export/', src.strip('/') )
        # if destination is empty move all files into /export/ and symlink back to source
        if not os.path.exists( dest ):
            dest_dir = os.path.dirname(dest)
            if not os.path.exists( dest_dir ):
                os.makedirs(dest_dir)
            shutil.move( src, dest )
            os.symlink( dest, src.rstrip('/') )
            os.chown( src, int(os.environ['GALAXY_UID']), int(os.environ['GALAXY_GID']) )
            subprocess.call( 'chown -R %s:%s %s' % ( os.environ['GALAXY_UID'], os.environ['GALAXY_GID'], dest ), shell=True )
        # if destination exists (e.g. continuing a previous session), remove source and symlink
        else:
            stripped_src = src.rstrip('/')
            if not os.path.islink( stripped_src ):
                if os.path.isdir( stripped_src ):
                    shutil.rmtree( stripped_src )
                else:
                    os.unlink( stripped_src )
                os.symlink( dest, src.rstrip('/') )


if __name__ == "__main__":
    """
        If the '/export/' folder exist, meaning docker was started with '-v /home/foo/bar:/export',
        we will link every file that needs to persist to the host system. Addionaly a file (/.galaxy_save) is
        created that indicates all linking is already done.
        If the user re-starts (with docker start) the container the file /.galaxy_save is found and the linking
        is aborted.
    """

    galaxy_root_dir = os.environ.get('GALAXY_ROOT', '/galaxy-central/')

    if os.path.exists( '/export/.distribution_config/' ):
        shutil.rmtree( '/export/.distribution_config/' )
    shutil.copytree( os.path.join(galaxy_root_dir, 'config'), '/export/.distribution_config/' )


    # Copy all files starting with "welcome"
    # This enables a flexible start page design.
    for filename in os.listdir('/export/'):
        if filename.startswith('welcome'):
            export_file = os.path.join( '/export/', filename)
            image_file = os.path.join('/etc/galaxy/web/', filename)
            shutil.copy(export_file, image_file)

    if not os.path.exists( '/export/galaxy-central/' ):
        os.makedirs("/export/galaxy-central/")
        os.chown( "/export/galaxy-central/", int(os.environ['GALAXY_UID']), int(os.environ['GALAXY_GID']) )

    change_path( os.path.join(galaxy_root_dir, 'config') )

    # copy image defaults to config/<file>.docker_sample to base derivatives on,
    # and if there is a realized version of these files in the export directory
    # replace Galaxy's copy with these. Use symbolic link instead of copying so
    # deployer can update and reload Galaxy and changes will be reflected.
    for config in [ 'galaxy.ini', 'job_conf.xml' ]:
        image_config = os.path.join('/etc/galaxy/', config)
        export_config = os.path.join( '/export/galaxy-central/config', config )
        export_sample = export_config + ".docker_sample"
        shutil.copy(image_config, export_sample)
        if os.path.exists(export_config):
            subprocess.call('ln -s -f %s %s' % (export_config, image_config), shell=True)

    change_path( os.path.join(galaxy_root_dir, 'tools.yaml') )
    change_path( os.path.join(galaxy_root_dir, 'integrated_tool_panel.xml') )
    change_path( os.path.join(galaxy_root_dir, 'display_applications') )
    change_path( os.path.join(galaxy_root_dir, 'tool_deps') )
    change_path( os.path.join(galaxy_root_dir, 'tool-data') )
    change_path( os.path.join(galaxy_root_dir, 'database') )
    change_path( '/shed_tools/' )
    
    if os.path.exists('/export/reports_htpasswd'):
        shutil.copy('/export/reports_htpasswd', '/etc/nginx/htpasswd')

    try:
        change_path('/var/lib/docker/')
    except:
        # In case of unprivileged access this will result in a "Device or resource busy." error.
        pass

    if not os.path.exists( PG_DATA_DIR_HOST ) or 'PG_VERSION' not in os.listdir( PG_DATA_DIR_HOST ):
        dest_dir = os.path.dirname( PG_DATA_DIR_HOST )
        if not os.path.exists( dest_dir ):
            os.makedirs(dest_dir)
        # User given dbpath, usually a directory from the host machine
        # copy the postgresql data folder to the new location
        subprocess.call('cp -R %s/* %s' % (PG_DATA_DIR_DEFAULT, PG_DATA_DIR_HOST), shell=True)
        # copytree needs an non-existing dst dir, how annoying :(
        # shutil.copytree(PG_DATA_DIR_DEFAULT, PG_DATA_DIR_HOST)
        subprocess.call('chown -R postgres:postgres /export/postgresql/', shell=True)
        subprocess.call('chmod -R 0755 /export/', shell=True)
        subprocess.call('chmod -R 0700 %s' % PG_DATA_DIR_HOST, shell=True)

    # change data_directory of PostgreSQL to the new location
    # This is not strictly needed because we are starting postgresql with pointing to the data directory
    new_data_directory = "'%s'" % PG_DATA_DIR_HOST
    cmd = 'sed -i "s|data_directory = .*|data_directory = %s|g" %s' % (new_data_directory, PG_CONF)
    subprocess.call(cmd, shell=True)
