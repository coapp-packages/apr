@import "version.inc";
@import "outercurve.inc";

package {
    name: "apr[${flavor}]";
    version: "${package-version}";
    arch : "${arch}";
    
    display-name: "apr";
    location: "http://coapp.org/repository/${OutputFilename}";

    feed: "http://coapp.org/repository/packages.atom.xml";
    publisher: "CoApp Project";
}

license[apr] {
    license-url: "http://www.apache.org/licenses/LICENSE-2.0.html";
    license-type: "apr";
}

files[files-to-sign] {
    include: { 
        dlls
    };    
}

files[dlls] {
    root: @"..\output\${arch}\Release\";
  
    include: {
        "libapr-2.dll",
    };
    
    trim-path: all;
};

requires {
    package: "expat[${flavor}]-2.0.1.3-${Package.Architecture}-${Package.PublicKeyToken}";
}


metadata {
    summary: "apr";
    description:  @"apr"; 

    icon: @"apr.png";
    
    author-version : "trunk";
    bug-tracker: "https://github.com/coapp-packages/apr/issues";
    stability : "0";
    licenses : {
        apache
    };
}

compatability-policy {
    minimum: "2.0.0.0";
    maximum: "${OneLessThanCurrent}"; // this is the default
    versions : {
        "2.0",
    }; // if not specified, find the versions by looking at the feeds and finding all the major/minor versions in range.
}

manifest[things-that-need-them2] {
    // all of our EXEs need to get the manifest entries for the assemblies we're creating in this package
    
    assembly : {
        expat,
    };
    
    include : { 
        dlls
    };
}

assembly[apr] {
    include : {
        dlls
    };
}

signing {
    attributes : {
        company="Outercurve Foundation",
        description="apr",
        product-name="lua",
        product-version="${package-version}",
        file-version="${package-version}",
    };
    
    replace-signature: true; 
    include: { 
        files-to-sign
    };    
}