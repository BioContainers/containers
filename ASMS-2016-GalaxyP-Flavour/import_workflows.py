#!/usr/bin/env python

import os
from bioblend import galaxy
admin_email = os.environ.get('GALAXY_DEFAULT_ADMIN_USER', 'admin@galaxy.org')
admin_pass = os.environ.get('GALAXY_DEFAULT_ADMIN_PASSWORD', 'admin')
url = "http://localhost:8080"
gi = galaxy.GalaxyInstance(url=url, email=admin_email, password=admin_pass)

wf = galaxy.workflows.WorkflowClient(gi)
wf.import_workflow_from_local_path('/shed_tools/toolshed.g2.bx.psu.edu/repos/galaxyp/asms_tutorial_2016/673718067538/asms_tutorial_2016/PeptideShaker_PSM_REPORT_to_NOVEL_peptides.ga')
wf.import_workflow_from_local_path('/shed_tools/toolshed.g2.bx.psu.edu/repos/galaxyp/asms_tutorial_2016/673718067538/asms_tutorial_2016/PeptideShaker_Identifcation_from_mzML.ga')
