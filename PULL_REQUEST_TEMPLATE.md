 # Requesting a Container  
 Follow the procedure [here](https://github.com/BioContainers/containers#241-how-to-request-a-container)
 
 # Submitting a Container  
 # Submitting a Container
 
 ## Check BioContainers' Dockerfile [specifications](https://github.com/BioContainers/specs)  
 ## Checklist
 
 1. Misc
 - [ ] My tool doesn't exist in [BioConda](#make-sure-your-tool-isnt-already-present-in-bioconda)   
 - [ ] The image can be built   
 
 2. [Metadata](#check-biocontainers-dockerfile-metadata)  
 - [ ] LABEL base_image  
 - [ ] LABEL version
 - [ ] LABEL software.version  
 - [ ] LABEL about.summary  
 - [ ] LABEL about.home  
 - [ ] LABEL about.license  
 - [ ] LABEL extra.identifier  
 - [ ] MAINTAINER  
 
 3. Extra
  - [ ] I have written tests in test-cmds.txt
 
 
 ## Check [BioContainers'](https://github.com/BioContainers/specs) Dockerfile metadata  
