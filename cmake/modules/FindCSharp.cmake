# - Try to find the gmcs and gacutil
#
# defines
#
# CSharp_FOUND - system has mono, mcs, gmcs and gacutil
# GMCS_PATH - where to find 'gmcs'
# GACUTIL_PATH - where to find 'gacutil'
#
# copyright (c) 2007 Arno Rehn arno@arnorehn.de
#
# Redistribution and use is allowed according to the terms of the GPL license.
#
# Modified by canming to find .NET on Windows
# copyright (c) 2009 - 2012 Canming Huang support@emgu.com

#IF(WIN32)
SET (PROGRAM_FILES_X86_ENV_STR "programfiles(x86)")

FIND_PROGRAM (CSC_EXECUTABLE_20 
NAMES csc gmcs
PATHS
$ENV{windir}/Microsoft.NET/Framework/v2.0.50727/
"C:/WINDOWS/Microsoft.NET/Framework/v2.0.50727"
/Library/Frameworks/Mono.framework/Commands/
)

FIND_PROGRAM (MSBUILD_EXECUTABLE_20 
NAMES msbuild xbuild
PATHS
$ENV{windir}/Microsoft.NET/Framework/v2.0.50727/
"C:/WINDOWS/Microsoft.NET/Framework/v2.0.50727"
/Library/Frameworks/Mono.framework/Commands/
)
IF(CSC_EXECUTABLE_20)
SET (CSC_EXECUTABLE ${CSC_EXECUTABLE_20})
SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_20})
ENDIF()

FIND_PROGRAM (CSC_EXECUTABLE_35 csc
$ENV{windir}/Microsoft.NET/Framework64/v3.5/
"C:/Windows/Microsoft.NET/Framework64/v3.5"
$ENV{windir}/Microsoft.NET/Framework/v3.5/
"C:/Windows/Microsoft.NET/Framework/v3.5"
)
FIND_PROGRAM (MSBUILD_EXECUTABLE_35 msbuild
$ENV{windir}/Microsoft.NET/Framework64/v3.5/
"C:/Windows/Microsoft.NET/Framework64/v3.5"
$ENV{windir}/Microsoft.NET/Framework/v3.5/
"C:/Windows/Microsoft.NET/Framework/v3.5"
)
IF(CSC_EXECUTABLE_35)
SET (CSC_EXECUTABLE ${CSC_EXECUTABLE_35})
SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_35})
ENDIF()

FIND_FILE (CSC_MSCORLIB_35 mscorlib.dll
"$ENV{programfiles}/Reference Assemblies/Microsoft/Framework/.NETFramework/v3.5/Profile/Client/"
"C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework/v3.5/Profile/Client/"
)

FIND_PROGRAM (CSC_EXECUTABLE_40 
NAMES csc mcs dmcs
PATHS
$ENV{windir}/Microsoft.NET/Framework64/v4.0.30319/
"C:/Microsoft.NET/Framework64/v4.0.30319/"
$ENV{windir}/Microsoft.NET/Framework/v4.0.30319/
"C:/Microsoft.NET/Framework/v4.0.30319/"
/Library/Frameworks/Mono.framework/Commands/)

FIND_PROGRAM (MSBUILD_EXECUTABLE_40 
NAMES msbuild xbuild 
PATHS
$ENV{windir}/Microsoft.NET/Framework64/v4.0.30319/
"C:/Microsoft.NET/Framework64/v4.0.30319/"
$ENV{windir}/Microsoft.NET/Framework/v4.0.30319/
"C:/Microsoft.NET/Framework/v4.0.30319/"
/Library/Frameworks/Mono.framework/Commands/)

FIND_PROGRAM (CSC_EXECUTABLE_120 
NAMES csc 
PATHS
$ENV{${PROGRAM_FILES_X86_ENV_STR}}/MSBuild/12.0/Bin/)
MESSAGE(STATUS "CSC_EXECUTABLE_120: ${CSC_EXECUTABLE_120}")

FIND_PROGRAM (MSBUILD_EXECUTABLE_120 
NAMES msbuild 
PATHS
$ENV{${PROGRAM_FILES_X86_ENV_STR}}/MSBuild/12.0/Bin/)
MESSAGE(STATUS "MSBUILD_EXECUTABLE_120 : ${MSBUILD_EXECUTABLE_120}")

FIND_PROGRAM (CSC_EXECUTABLE_140 
NAMES csc 
PATHS
$ENV{${PROGRAM_FILES_X86_ENV_STR}}/MSBuild/14.0/Bin/)
MESSAGE(STATUS "CSC_EXECUTABLE_140: ${CSC_EXECUTABLE_140}")

FIND_PROGRAM (MSBUILD_EXECUTABLE_140 
NAMES msbuild 
PATHS
$ENV{${PROGRAM_FILES_X86_ENV_STR}}/MSBuild/14.0/Bin/)
MESSAGE(STATUS "MSBUILD_EXECUTABLE_140 : ${MSBUILD_EXECUTABLE_140}")

FIND_PROGRAM (CSC_EXECUTABLE_150 
NAMES csc 
PATHS
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft Visual Studio/2017/Community/MSBuild/15.0/Bin/Roslyn")
MESSAGE(STATUS "CSC_EXECUTABLE_150: ${CSC_EXECUTABLE_150}")

FIND_PROGRAM (MSBUILD_EXECUTABLE_150 
NAMES msbuild 
PATHS
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft Visual Studio/2017/Community/MSBuild/15.0/Bin")
MESSAGE(STATUS "MSBUILD_EXECUTABLE_150 : ${MSBUILD_EXECUTABLE_150}")

FIND_PROGRAM (CSC_EXECUTABLE_160 
NAMES csc 
PATHS
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft Visual Studio/2019/Community/MSBuild/Current/Bin/Roslyn")

MESSAGE(STATUS "CSC_EXECUTABLE_160: ${CSC_EXECUTABLE_160}")
FIND_PROGRAM (MSBUILD_EXECUTABLE_160 
NAMES msbuild 
PATHS
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft Visual Studio/2019/Community/MSBuild/Current/Bin")
MESSAGE(STATUS "MSBUILD_EXECUTABLE_160 : ${MSBUILD_EXECUTABLE_160}")


SET(CSC_FOUND FALSE)

IF(CSC_EXECUTABLE_20)
  SET (CSC_EXECUTABLE ${CSC_EXECUTABLE_20})
  IF (CSC_PREFERRED_VERSION MATCHES "2.0")
	SET(CSC_FOUND TRUE)
  ENDIF()
ENDIF()

IF(CSC_EXECUTABLE_35 AND (NOT ${CSC_FOUND}))
  SET (CSC_EXECUTABLE ${CSC_EXECUTABLE_35})
  IF (CSC_PREFERRED_VERSION MATCHES "3.5")
	SET(CSC_FOUND TRUE)
  ENDIF()
ENDIF()

IF(CSC_EXECUTABLE_40 AND (NOT ${CSC_FOUND}))
  SET (CSC_EXECUTABLE ${CSC_EXECUTABLE_40})
  IF (CSC_PREFERRED_VERSION MATCHES "4.0")
	SET(CSC_FOUND TRUE)
  ENDIF()  
ENDIF()

IF(CSC_EXECUTABLE_120 AND (NOT ${CSC_FOUND}))
  SET (CSC_EXECUTABLE ${CSC_EXECUTABLE_120})
  IF (CSC_PREFERRED_VERSION MATCHES "12.0")
	SET(CSC_FOUND TRUE)
  ENDIF()  
ENDIF()

IF(CSC_EXECUTABLE_140 AND (NOT ${CSC_FOUND}))
  SET (CSC_EXECUTABLE ${CSC_EXECUTABLE_140})
  
  IF (CSC_PREFERRED_VERSION MATCHES "14.0")
	SET(CSC_FOUND TRUE)
  ENDIF()  
ENDIF()

IF(CSC_EXECUTABLE_150 AND (NOT ${CSC_FOUND}))
  SET (CSC_EXECUTABLE ${CSC_EXECUTABLE_150})
  IF (CSC_PREFERRED_VERSION MATCHES "15.0")
	SET(CSC_FOUND TRUE)
  ENDIF()  
ENDIF()

IF(CSC_EXECUTABLE_160 AND (NOT ${CSC_FOUND}))
  SET (CSC_EXECUTABLE ${CSC_EXECUTABLE_160})
  IF (CSC_PREFERRED_VERSION MATCHES "16.0")
	SET(CSC_FOUND TRUE)
  ENDIF()  
ENDIF()

IF(MSBUILD_EXECUTABLE_20)
  SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_20})
ENDIF()

IF(MSBUILD_EXECUTABLE_35)
  SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_35})
ENDIF()

IF(MSBUILD_EXECUTABLE_40)
  SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_40})
ENDIF()

IF(MSBUILD_EXECUTABLE_120)
  SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_120})
ENDIF()

IF(MSBUILD_EXECUTABLE_140)
  SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_140})
ENDIF()

IF(MSBUILD_EXECUTABLE_150)
  SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_150})
ENDIF()

IF(MSBUILD_EXECUTABLE_160)
  SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_160})
ENDIF()


#IF(CSC_EXECUTABLE_40 AND CSC_PREFERRED_VERSION MATCHES "4.0")
#SET (MSBUILD_EXECUTABLE ${MSBUILD_EXECUTABLE_40})
#ENDIF()
#ELSE(WIN32)
#FIND_PROGRAM (CSC_EXECUTABLE mcs)
#FIND_PROGRAM (MSBUILD_EXECUTABLE xbuild)
#ENDIF(WIN32)


FIND_PROGRAM (GACUTIL_EXECUTABLE gacutil 
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v10.0A/bin/NETFX 4.6.1 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v10.0A/bin/NETFX 4.6 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v8.1A/bin/NETFX 4.5.1 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v8.0A/bin/NETFX 4.0 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v7.1A/Bin"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v7.0/Bin" 
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v7.0A/Bin"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v6.0/Bin" 
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v6.0A/Bin"
"C:/Program Files/Microsoft SDKs/Windows/v6.0/bin" 
"C:/Program Files/Microsoft SDKs/Windows/v6.0A/bin" 
/usr/lib/mono/2.0
/usr/bin
/Library/Frameworks/Mono.framework/Commands/
)

FIND_PROGRAM (AL_EXECUTABLE al
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v10.0A/bin/NETFX 4.6.1 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v10.0A/bin/NETFX 4.6 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v8.1A/bin/NETFX 4.5.1 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v8.0A/bin/NETFX 4.0 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v7.1A/Bin"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v7.0/Bin" 
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v7.0A/Bin"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v6.0/Bin" 
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v6.0A/Bin"
"C:/Program Files/Microsoft SDKs/Windows/v7.0/bin"
"C:/Program Files/Microsoft SDKs/Windows/v7.0A/bin"
"C:/Program Files/Microsoft SDKs/Windows/v6.0/bin" 
"C:/Program Files/Microsoft SDKs/Windows/v6.0A/bin"
"C:/WINDOWS/Microsoft.NET/Framework/v2.0.50727"
"C:/Windows/Microsoft.NET/Framework/v3.5" 
$ENV{windir}/Microsoft.NET/Framework/v3.5
$ENV{windir}/Microsoft.NET/Framework/v2.0.50727
/usr/lib/mono/2.0
/usr/bin
/Library/Frameworks/Mono.framework/Commands/
)

FIND_PROGRAM (RESGEN_EXECUTABLE resgen
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v10.0A/bin/NETFX 4.6.1 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v10.0A/bin/NETFX 4.6 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v8.1A/bin/NETFX 4.5.1 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v8.0A/bin/NETFX 4.0 Tools"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v7.1A/Bin"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v7.0/Bin" 
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v7.0A/Bin"
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v6.0/Bin" 
"$ENV{${PROGRAM_FILES_X86_ENV_STR}}/Microsoft SDKs/Windows/v6.0A/Bin"
"$ENV{programfiles}/Microsoft Visual Studio 8/SDK/v2.0/Bin"
"C:/Program Files/Microsoft SDKs/Windows/v7.0/bin"
"C:/Program Files/Microsoft SDKs/Windows/v7.0A/bin"
"C:/Program Files/Microsoft SDKs/Windows/v6.0/bin" 
"C:/Program Files/Microsoft SDKs/Windows/v6.0A/bin"
"C:/Program Files/Microsoft Visual Studio 8/SDK/v2.0/Bin"
/usr/bin
/Library/Frameworks/Mono.framework/Commands/
)

FIND_PROGRAM(DOTNET_EXECUTABLE dotnet)
  
SET (CSharp_FOUND FALSE)
IF (DOTNET_EXECUTABLE)
  SET (CSharp_FOUND TRUE)
ENDIF()

IF (CSC_EXECUTABLE AND AL_EXECUTABLE AND RESGEN_EXECUTABLE AND MSBUILD_EXECUTABLE)
  SET (CSharp_FOUND TRUE)
ENDIF ()

IF (NOT CSharp_FIND_QUIETLY)
  IF (CSC_EXECUTABLE)
    MESSAGE(STATUS "Found csc: ${CSC_EXECUTABLE}")
  ELSE()
    MESSAGE(STATUS "Could not find csc")
  ENDIF (CSC_EXECUTABLE)
  IF (GACUTIL_EXECUTABLE)
    MESSAGE(STATUS "Found gacutil: ${GACUTIL_EXECUTABLE}")
  ELSE()
    MESSAGE(STATUS "Could not find gacutil")
  ENDIF (GACUTIL_EXECUTABLE)
  IF (AL_EXECUTABLE)
    MESSAGE(STATUS "Found al: ${AL_EXECUTABLE}")
  ELSE()
    MESSAGE(STATUS "Could not find al")
  ENDIF (AL_EXECUTABLE)
  IF (RESGEN_EXECUTABLE)
    MESSAGE(STATUS "Found resgen: ${RESGEN_EXECUTABLE}")
  ELSE()
    MESSAGE(STATUS "Could not find resgen")
  ENDIF(RESGEN_EXECUTABLE)
  IF (MSBUILD_EXECUTABLE)
    MESSAGE(STATUS "Found msbuild: ${MSBUILD_EXECUTABLE}")
  ELSE()
    MESSAGE(STATUS "Could not find msbuild")
  ENDIF()
  IF(DOTNET_EXECUTABLE)
    MESSAGE(STATUS "FOUND dotnet: ${DOTNET_EXECUTABLE}")
  ELSE()
    MESSAGE(STATUS "Could not find dotnet")
  ENDIF()
ENDIF (NOT CSharp_FIND_QUIETLY)

IF (CSharp_FOUND)
ELSE (CSharp_FOUND)
  IF (CSharp_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could not find one or more of the following programs: csc, gacutil, al, resgen, msbuild, dotnet")
  ENDIF (CSharp_FIND_REQUIRED)
ENDIF (CSharp_FOUND)

MARK_AS_ADVANCED(CSC_EXECUTABLE AL_EXECUTABLE GACUTIL_EXECUTABLE MSBUILD_EXECUTABLE DOTNET_EXECUTABLE)


