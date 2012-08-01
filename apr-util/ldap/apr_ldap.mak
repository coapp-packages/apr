# Microsoft Developer Studio Generated NMAKE File, Based on apr_ldap.dsp
!IF "$(CFG)" == ""
CFG=apr_ldap - Win32 Release
!MESSAGE No configuration specified. Defaulting to apr_ldap - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "apr_ldap - Win32 Release" && "$(CFG)" != "apr_ldap - Win32 Debug" && "$(CFG)" != "apr_ldap - x64 Release" && "$(CFG)" != "apr_ldap - x64 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "apr_ldap.mak" CFG="apr_ldap - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "apr_ldap - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "apr_ldap - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "apr_ldap - x64 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "apr_ldap - x64 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

APR_PATH=..\apr
API_PATH=..\apr-iconv
APU_PATH=..\apr-util

!IFNDEF OUTDIR
!IF  "$(CFG)" == "apr_ldap - Win32 Release"
OUTDIR=.\Release
!ELSEIF  "$(CFG)" == "apr_ldap - Win32 Debug"
OUTDIR=.\Debug
!ELSEIF  "$(CFG)" == "apr_ldap - x64 Release"
OUTDIR=.\x64\Release
!ELSEIF  "$(CFG)" == "apr_ldap - x64 Debug"
OUTDIR=.\x64\Debug
!ENDIF
!ENDIF

!IF  "$(CFG)" == "apr_ldap - Win32 Release"
INTDIR=.\Release
CPP_PROJ_VAR=/MD /O2 /Oy- /D "NDEBUG"
MTL_PROJ_VAR=/D "NDEBUG" 
RSC_PROJ_VAR=/d "NDEBUG" 
LINK32_FLAGS_VAR=/MACHINE:X86 /opt:ref
!ELSEIF  "$(CFG)" == "apr_ldap - Win32 Debug"
INTDIR=.\Debug
CPP_PROJ_VAR=/MDd /Od /D "_DEBUG" /EHsc 
MTL_PROJ_VAR=/D "_DEBUG" 
RSC_PROJ_VAR=/d "_DEBUG" 
LINK32_FLAGS_VAR=/MACHINE:X86 
!ELSEIF  "$(CFG)" == "apr_ldap - x64 Release"
INTDIR=.\x64\Release
CPP_PROJ_VAR=/MD /O2 /Oy- /D "NDEBUG"
MTL_PROJ_VAR=/D "NDEBUG" 
RSC_PROJ_VAR=/d "NDEBUG" 
LINK32_FLAGS_VAR=/MACHINE:X64 /opt:ref
!ELSEIF  "$(CFG)" == "apr_ldap - x64 Debug"
INTDIR=.\x64\Debug
CPP_PROJ_VAR=/MDd /Od /D "_DEBUG" /EHsc 
MTL_PROJ_VAR=/D "_DEBUG" 
RSC_PROJ_VAR=/d "_DEBUG" 
LINK32_FLAGS_VAR=/MACHINE:X64 
!ENDIF

CPP=cl.exe
CPP_PROJ=/nologo /W3 /Zi /I "../include" /I "$(APR_PATH)/include" /I "../include/private" /D "WIN32" /D "_WINDOWS" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\apr_ldap_src" /FD /c  $(CPP_PROJ_VAR) 
MTL=midl.exe
MTL_PROJ=/nologo /mktyplib203 /o /win32 "NUL" $(MTL_PROJ_VAR) 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\apr_ldap-1.res" /i "../include" /i "$(APR_PATH)/include" /d DLL_NAME="apr_ldap" /d "APU_VERSION_ONLY" $(RSC_PROJ_VAR) 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\apr_ldap.bsc" 
BSC32_SBRS= \

LINK32=link.exe
LINK32_FLAGS=kernel32.lib advapi32.lib ws2_32.lib mswsock.lib wldap32.lib ole32.lib "$(APR_OUT)\libapr-1.lib" /nologo /base:"0x6EEB0000" /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\apr_ldap-1.pdb" /debug /machine:IX86 /out:"$(OUTDIR)\apr_ldap-1.dll" /implib:"$(OUTDIR)\apr_ldap-1.lib" $(LINK32_FLAGS_VAR) 


!IF "$(RECURSE)" == "1" 
!IF  "$(CFG)" == "apr_ldap - Win32 Release"
ALL : "libaprutil - Win32 Release" "$(OUTDIR)\apr_ldap-1.dll"
CLEAN :"libaprutil - Win32 ReleaseCLEAN" 
!ELSEIF  "$(CFG)" == "apr_ldap - Win32 Debug"
ALL : "libaprutil - Win32 Debug" "$(OUTDIR)\apr_ldap-1.dll"
CLEAN :"libaprutil - Win32 DebugCLEAN" 
!ELSEIF  "$(CFG)" == "apr_ldap - x64 Release"
ALL : "libaprutil - x64 Release" "$(OUTDIR)\apr_ldap-1.dll"
CLEAN :"libaprutil - x64 ReleaseCLEAN" 
!ELSEIF  "$(CFG)" == "apr_ldap - x64 Debug"
ALL : "libaprutil - x64 Debug" "$(OUTDIR)\apr_ldap-1.dll"
CLEAN :"libaprutil - x64 DebugCLEAN" 
!ENDIF
!ELSE 
ALL : "$(OUTDIR)\apr_ldap-1.dll"
CLEAN :
!ENDIF 
	-@erase "$(INTDIR)\apr_ldap-1.res"
	-@erase "$(INTDIR)\apr_ldap_init.obj"
	-@erase "$(INTDIR)\apr_ldap_option.obj"
	-@erase "$(INTDIR)\apr_ldap_rebind.obj"
	-@erase "$(INTDIR)\apr_ldap_src.idb"
	-@erase "$(INTDIR)\apr_ldap_src.pdb"
	-@erase "$(OUTDIR)\apr_ldap-1.dll"
	-@erase "$(OUTDIR)\apr_ldap-1.exp"
	-@erase "$(OUTDIR)\apr_ldap-1.lib"
	-@erase "$(OUTDIR)\apr_ldap-1.pdb"

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
	"$(INTDIR)\apr_ldap_init.obj" \
	"$(INTDIR)\apr_ldap_option.obj" \
	"$(INTDIR)\apr_ldap_rebind.obj" \
	"$(INTDIR)\apr_ldap-1.res" \
	"$(APU_OUT)\libaprutil-1.lib"

"$(OUTDIR)\apr_ldap-1.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

TargetPath=$(OUTDIR)\apr_ldap-1.dll
SOURCE="$(InputPath)"
PostBuild_Desc=Embed .manifest
DS_POSTBUILD_DEP=$(INTDIR)\postbld.dep

ALL : $(DS_POSTBUILD_DEP)

$(DS_POSTBUILD_DEP) : "$(OUTDIR)\apr_ldap-1.dll"
   if exist $(OUTDIR)\apr_ldap-1.dll.manifest mt.exe -manifest $(OUTDIR)\apr_ldap-1.dll.manifest -outputresource:$(OUTDIR)\apr_ldap-1.dll;2
	echo Helper for Post-build step > "$(DS_POSTBUILD_DEP)"


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("apr_ldap.dep")
!INCLUDE "apr_ldap.dep"
!ELSE 
!MESSAGE Warning: cannot find "apr_ldap.dep"
!ENDIF 
!ENDIF 


SOURCE=.\apr_ldap_init.c

"$(INTDIR)\apr_ldap_init.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\apr_ldap_option.c

"$(INTDIR)\apr_ldap_option.obj" : $(SOURCE) "$(INTDIR)"


SOURCE=.\apr_ldap_rebind.c

"$(INTDIR)\apr_ldap_rebind.obj" : $(SOURCE) "$(INTDIR)"


"libaprutil - Win32 Release" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" 
   cd ".\ldap"

"libaprutil - Win32 ReleaseCLEAN" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Release" RECURSE=1 CLEAN 
   cd ".\ldap"

"libaprutil - Win32 Debug" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" 
   cd ".\ldap"

"libaprutil - Win32 DebugCLEAN" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - Win32 Debug" RECURSE=1 CLEAN 
   cd ".\ldap"

"libaprutil - x64 Release" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Release" 
   cd ".\ldap"

"libaprutil - x64 ReleaseCLEAN" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Release" RECURSE=1 CLEAN 
   cd ".\ldap"

"libaprutil - x64 Debug" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Debug" 
   cd ".\ldap"

"libaprutil - x64 DebugCLEAN" : 
   cd "\tmp\apr-util"
   $(MAKE) /$(MAKEFLAGS) /F ".\libaprutil.mak" CFG="libaprutil - x64 Debug" RECURSE=1 CLEAN 
   cd ".\ldap"


SOURCE=..\libaprutil.rc


"$(INTDIR)\apr_ldap-1.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\apr_ldap-1.res" /i "../include" /i "$(APR_PATH)/include" /i "\tmp\apr-util" /d DLL_NAME="apr_ldap" /d "APU_VERSION_ONLY" $(RSC_PROJ_VAR) $(SOURCE)


"$(INTDIR)" :
    if not exist "$(INTDIR)/$(NULL)" mkdir "$(INTDIR)"


