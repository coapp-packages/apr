@import "version.inc" ;
@import "outercurve.inc" ;

package {
    name: "apr-dev[${flavor}]";
    version: "${package-version}";
    arch : "${arch}";

    display-name: "apr developer library";
}

metadata {
    summary: "The apr developer library";
    description: @"apr"; 

    icon: @"apr.png";
    
    author-version : "trunk";
    bug-tracker: "https://github.com/coapp-packages/apr/issues";
    stability : "0";
    licenses : {
        apache
    };
}

requires {
    package: "apr-dev-common-${package-version}-any-${Package.PublicKeyToken}";
    package: "apr[${flavor}]-${package-version}-${Package.Architecture}-${Package.PublicKeyToken}";
	package: "expat-dev-common-2.0.1.3-any-${Package.PublicKeyToken}";
    package: "expat[${flavor}]-2.0.1.3-${Package.Architecture}-${Package.PublicKeyToken}";
}

files[staticlibs] {
    root: @"..\output\${arch}\LibR\";
    
    include: {
        "apr-2.lib",
    };
    
    trim-path: all;
};

files[libs] {
    root: @"..\output\${arch}\Release\";
    
    include: {
        "libapr-2.lib",
    };
    
    trim-path: all;
};

developer-library[apr] {
    libraries : {
        libs,
		staticlibs
    };
}