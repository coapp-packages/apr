# Microsoft Developer Studio Generated NMAKE File, Based on apr_dbd_odbc.dsp
!IF "$(CFG)" == ""
CFG=apr_dbd_odbc - Win32 Debug
!MESSAGE No configuration specified. Defaulting to apr_dbd_odbc - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "apr_dbd_odbc - Win32 Release" && "$(CFG)" != "apr_dbd_odbc - Win32 Debug" && "$(CFG)" != "apr_dbd_odbc - x64 Release" && "$(CFG)" != "apr_dbd_odbc - x64 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "apr_dbd_odbc.mak" CFG="apr_dbd_odbc - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "apr_dbd_odbc - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "apr_dbd_odbc - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "apr_dbd_odbc - x64 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "apr_dbd_odbc - x64 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

APR_PATH=..\..\apr
API_PATH=..\..\apr-iconv
APU_PATH=..\..\apr-util

!IFNDEF OUTDIR
!IF  "$(CFG)" == "apr_dbd_odbc - Win32 Release"
OUTDIR=.\Release
!ELSEIF  "$(CFG)" == "apr_dbd_odbc - Win32 Debug"
OUTDIR=.\Debug
!ELSEIF  "$(CFG)" == "apr_dbd_odbc - x64 Release"
OUTDIR=.\x64\Release
!ELSEIF  "$(CFG)" == "apr_dbd_odbc - x64 Debug"
OUTDIR=.\x64\Debug
!ENDIF
!ENDIF

!IF  "$(CFG)" == "apr_dbd_odbc - Win32 Release"
INTDIR=.\Release
CPP_PROJ_VAR=/MD /O2 /Oy- /D "NDEBUG"
MTL_PROJ_VAR=/D "NDEBUG" 
RSC_PROJ_VAR=/d "NDEBUG" 
LINK32_FLAGS_VAR=/MACHINE:X86 /opt:ref
!ELSEIF  "$(CFG)" == "apr_dbd_odbc - Win32 Debug"
INTDIR=.\Debug
CPP_PROJ_VAR=/MDd /Od /D "_DEBUG" /EHsc 
MTL_PROJ_VAR=/D "_DEBUG" 
RSC_PROJ_VAR=/d "_DEBUG" 
LINK32_FLAGS_VAR=/MACHINE:X86 
!ELSEIF  "$(CFG)" == "apr_dbd_odbc - x64 Release"
INTDIR=.\x64\Release
CPP_PROJ_VAR=/MD /O2 /Oy- /D "NDEBUG"
MTL_PROJ_VAR=/D "NDEBUG" 
RSC_PROJ_VAR=/d "NDEBUG" 
LINK32_FLAGS_VAR=/MACHINE:X64 /opt:ref
!ELSEIF  "$(CFG)" == "apr_dbd_odbc - x64 Debug"
INTDIR=.\x64\Debug
CPP_PROJ_VAR=/MDd /Od /D "_DEBUG" /EHsc 
MTL_PROJ_VAR=/D "_DEBUG" 
RSC_PROJ_VAR=/d "_DEBUG" 
LINK32_FLAGS_VAR=/MACHINE:X64 
!ENDIF

CPP=cl.exe
CPP_PROJ=/nologo /W3 /Zi /I "../include" /I "$(APR_PATH)/include" /I "../include/private" /D "HAVE_SQL_H" /D "WIN32" /D "_WINDOWS" /D "APU_DSO_MODULE_BUILD" /D APU_HAVE_ODBC=1 /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\apr_dbd_odbc_src" /FD /c $(CPP_PROJ_VAR) 
MTL=midl.exe
MTL_PROJ=/nologo //mktyplib203 /o /win32 "NUL" $(MTL_PROJ_VAR) 
RSC=rc.exe
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\apr_dbd_odbc.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib advapi32.lib ws2_32.lib mswsock.lib ole32.lib odbc32.lib odbccp32.lib "$(APR_OUT)\libapr-1.lib" /nologo /base:"0x6EF00000" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\apr_dbd_odbc-1.pdb" /debug /machine:IX86 /out:"$(OUTDIR)\apr_dbd_odbc-1.dll" /implib:"$(OUTDIR)\apr_dbd_odbc-1.lib" $(LINK32_FLAGS_VAR) 


!IF "$(RECURSE)" == "1" 
!IF  "$(CFG)" == "apr_dbd_odbc - Win32 Release"
ALL : "libaprutil - Win32 Release" "$(OUTDIR)\apr_dbd_odbc-1.dll"
CLEAN :"libaprutil - Win32 ReleaseCLEAN" 
!ELSEIF  "$(CFG)" == "apr_dbd_odbc - Win32 Debug"
ALL : "libaprutil - Win32 Debug" "$(OUTDIR)\apr_dbd_odbc-1.dll"
CLEAN :"libaprutil - Win32 DebugCLEAN" 
!ELSEIF  "$(CFG)" == "apr_dbd_odbc - x64 Release"
ALL : "libaprutil - x64 Release" "$(OUTDIR)\apr_dbd_odbc-1.dll"
CLEAN :"libaprutil - x64 ReleaseCLEAN" 
!ELSEIF  "$(CFG)" == "apr_dbd_odbc - x64 Debug"
ALL : "libaprutil - x64 Debug" "$(OUTDIR)\apr_dbd_odbc-1.dll"
CLEAN :"libaprutil - x64 DebugCLEAN" 
!ENDIF
!ELSE 
ALL : "$(OUTDIR)\apr_dbd_odbc-1.dll"
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\apr_dbd_odbc.obj"
	-@erase "$(INTDIR)\apr_dbd_odbc_src.idb"
	-@erase "$(INTDIR)\apr_dbd_odbc_src.pdb"
	-@erase "$(OUTDIR)\apr_dbd_odbc-1.dll"
	-@erase "$(OUTDIR)\apr_dbd_odbc-1.exp"
	-@erase "$(OUTDIR)\apr_dbd_odbc-1.lib"
	-@erase "$(OUTDIR)\apr_dbd_odbc-1.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

LINK32_OBJS= \
	"$(INTDIR)\apr_dbd_odbc.obj" \
	"$(APU_OUT)\libaprutil-1.lib"

"$(OUTDIR)\apr_dbd_odbc-1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

TargetPath=$(OUTDIR)\apr_dbd_odbc-1.dll
SOURCE="$(InputPath)"
PostBuild_Desc=Embed .manifest
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\apr_dbd_odbc-1.dll"
   if exist $(OUTDIR)\apr_dbd_odbc-1.dll.manifest mt.exe -manifest $(OUTDIR)\apr_dbd_odbc-1.dll.manifest -outputresource:$(OUTDIR)\apr_dbd_odbc-1.dll;2
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("apr_dbd_odbc.dep")
!INCLUDE "apr_dbd_odbc.dep"
!ELSE 
!MESSAGE Warning: cannot find "apr_dbd_odbc.dep"
!ENDIF 
!ENDIF 


SOURCE=.\apr_dbd_odbc.c

"$(INTDIR)\apr_dbd_odbc.obj" : $(SOURCE) "$(INTDIR)"


"libaprutil - Win32 Release" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" 
   cd ".\dbd"

"libaprutil - Win32 ReleaseCLEAN" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" RECURSE=1 CLEAN 
   cd ".\dbd"

"libaprutil - Win32 Debug" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" 
   cd ".\dbd"

"libaprutil - Win32 DebugCLEAN" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\dbd"

"libaprutil - x64 Release" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Release" 
   cd ".\dbd"

"libaprutil - x64 ReleaseCLEAN" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Release" RECURSE=1 CLEAN 
   cd ".\dbd"

"libaprutil - x64 Debug" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Debug" 
   cd ".\dbd"

"libaprutil - x64 DebugCLEAN" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Debug" RECURSE=1 CLEAN 
   cd ".\dbd"


"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"


