#!/usr/bin/env python

import os
import time
import yaml
import argparse
import subprocess
import logging as log
from bioblend import galaxy
from subprocess import CalledProcessError


def main( data ):
    """
    Load files into a Galaxy data library.
    By default all test-data tools from all installed tools
    will be linked into a data library.
    """

    log.info("Importing data libraries.")

    url = "http://localhost:8080"
    # The environment variables are set by the parent container
    admin_email = os.environ.get('GALAXY_DEFAULT_ADMIN_USER', 'admin@galaxy.org')
    admin_pass = os.environ.get('GALAXY_DEFAULT_ADMIN_PASSWORD', 'admin')

    # Establish connection to galaxy instance
    gi = galaxy.GalaxyInstance(url=url, email=admin_email, password=admin_pass)

    jc = galaxy.jobs.JobsClient(gi)

    folders = dict()

    libraries = yaml.load(data)
    for lib in libraries['libraries']:
        folders[lib['name']] = lib['files']

    if folders:
        log.info("Create 'Test Data' library.")
        lib = gi.libraries.create_library('Training Data', 'Data pulled from online archives.')
        lib_id = lib['id']

        for fname, urls in folders.items():
            log.info("Creating folder: %s" % fname)
            folder = gi.libraries.create_folder( lib_id, fname )
            for url in urls:
                gi.libraries.upload_file_from_url(
                    lib_id,
                    url,
                    folder_id = folder[0]['id'],
                )
        
        no_break = True
        while True:
            no_break = False
            for job in jc.get_jobs():
                if job['state'] != 'ok':
                    no_break = True
            if not no_break:
                break
            time.sleep(3)


        time.sleep(20)
        log.info("Finished importing test data.")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Populate the Galaxy data library with test data.'
    )
    parser.add_argument("-v", "--verbose", help="Increase output verbosity.",
                    action="store_true")
    parser.add_argument('-i', '--infile', type=argparse.FileType('r'))

    #TODO:  Add options to override the admin_user and admin_password + specify 
    #       files to upload via command line interface.

    args = parser.parse_args()
    if args.verbose:
        log.basicConfig(level=log.DEBUG)

    main( args.infile )

