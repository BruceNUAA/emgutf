# --------------------------------------------------------
#  Copyright (C) 2004-2019 by EMGU Corporation. All rights reserved.
# --------------------------------------------------------

IF(HAVE_WINDESKTOP OR HAVE_WINDESKTOP_LITE)
  #MESSAGE(STATUS "MSBUILD_EXECUTABLE_40: ${MSBUILD_EXECUTABLE_40}")
  IF(NOT ("${MSBUILD_EXECUTABLE_150}" STREQUAL ""))
    SET(MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_150})
  ELSE()
    MESSAGE(STATUS "Not able to find MSBUILD 150, Documentation build may not produce the right output.")
  ENDIF()
ENDIF()

IF("${MSBUILD_EXECUTABLE}" STREQUAL "")
  MESSAGE(STATUS "MSBUILD_EXECUTABLE NOT FOUND, skipping documentation projects.")
ELSE()
  IF(HAVE_WINDESKTOP)  
    MESSAGE(STATUS "MSBUILD_EXECUTABLE for documentation building: ${MSBUILD_EXECUTABLE}")
    PROJECT(Emgu.TF.Document.Html)
    ADD_CUSTOM_TARGET(
       ${PROJECT_NAME}
       COMMAND ${MSBUILD_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.html.shfbproj
       SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.html.shfbproj
    )
    ADD_DEPENDENCIES(${PROJECT_NAME} Emgu.TF.Netstandard)
    
    PROJECT(Emgu.TF.Documentation.chm)
    ADD_CUSTOM_TARGET(
       ${PROJECT_NAME} ALL
       COMMAND ${MSBUILD_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.html.shfbproj /property:OutputPath=. /property:HelpFileFormat=HtmlHelp1
       SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.html.shfbproj
    )
    ADD_DEPENDENCIES(${PROJECT_NAME} Emgu.TF.Netstandard)
  
    INSTALL(
      FILES
      "${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.Documentation.chm"
      DESTINATION .
      COMPONENT emgutf_document
      )
  ENDIF()
  
  IF(HAVE_WINDESKTOP_LITE)  
    PROJECT(Emgu.TF.Lite.Document.Html)
    ADD_CUSTOM_TARGET(
       ${PROJECT_NAME}
       COMMAND ${MSBUILD_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.Lite.html.shfbproj
       SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.Lite.html.shfbproj
    )
    ADD_DEPENDENCIES(${PROJECT_NAME} Emgu.TF.Lite.Net45)
    
    PROJECT(Emgu.TF.Lite.Documentation.chm)
    ADD_CUSTOM_TARGET(
       ${PROJECT_NAME} ALL
       COMMAND ${MSBUILD_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.Lite.html.shfbproj /property:OutputPath=. /property:HelpFileFormat=HtmlHelp1
       SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.Lite.html.shfbproj
    )
    ADD_DEPENDENCIES(${PROJECT_NAME} Emgu.TF.Lite.Net45)
    
    INSTALL(
      FILES
      "${CMAKE_CURRENT_SOURCE_DIR}/Emgu.TF.Lite.Documentation.chm"
      DESTINATION .
      COMPONENT emgutf_document
      )
  ENDIF()
ENDIF()

