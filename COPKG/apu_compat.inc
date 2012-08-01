compatability-policy {
    minimum: "1.4.2.0";
    maximum: "${OneLessThanCurrent}"; // this is the default
}

#define { 
    author-version: 1.4.2;
    outercurve-publickeytoken: "1e373a58e25250cb";
    deps-publickeytoken: "${outercurve-publickeytoken}";
    apr-dep-version: "1.4.6";
    apr-dep-publickeytoken: "${deps-publickeytoken}";
    api-dep-version: "1.2.1";
    api-dep-publickeytoken: "${deps-publickeytoken}";
}
