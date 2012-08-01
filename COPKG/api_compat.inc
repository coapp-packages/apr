compatability-policy {
    minimum: "1.2.1.0";
    maximum: "${OneLessThanCurrent}";
}

#define { 
    author-version: 1.2.1;
    outercurve-publickeytoken: "1e373a58e25250cb";
    deps-publickeytoken: "${outercurve-publickeytoken}";
    apr-dep-version: "1.4.6";
    apr-dep-publickeytoken: "${deps-publickeytoken}";
}
