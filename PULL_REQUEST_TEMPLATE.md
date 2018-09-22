 # Submitting a Container
 
 (If you're requesting for a new container, please check the procedure described [here](https://github.com/BioContainers/containers#241-how-to-request-a-container).  
 
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
 - [ ] MAINTAINER  
 
 3. Extra (optionals)
  - [ ] I have written tests in test-cmds.txt  
  - [ ] LABEL extra.identifier    
  - [ ] LABEL about.documentation   
  - [ ] LABEL about.license_file
  - [ ] LABEL about.tags   
 
 
 ## Check [BioContainers'](https://github.com/BioContainers/specs) Dockerfile metadata  
