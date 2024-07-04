###
# Copyright (c) 2018  Wenzhou Institute, University of Chinese Academy of Sciences.
# See the accompanying Manual for the contributors and the way to cite this work.
# Comments and suggestions welcome. Please contact
# Dr. Guanghong Zuo <ghzuo@ucas.ac.cn>
# 
# @Author: Dr. Guanghong Zuo
# @Date: 2017-09-01 15:55:03
# @Last Modified By: Dr. Guanghong Zuo
# @Last Modified Time: 2024-04-29 10:15:40
###

LINK_LIBRARIES(libkit.a)

SET(KITHEADS 
  stringOpt.h  memory.h jsonctl.h
  info.h ompOpt.h kit.h
  )

SET(LIBKIT_SRC ${KITHEADS}
  stringOpt.cpp  memory.cpp
  info.cpp fileOpt.cpp jsonctl.cpp ompOpt.cpp
  )

ADD_LIBRARY(kit STATIC ${LIBKIT_SRC})

