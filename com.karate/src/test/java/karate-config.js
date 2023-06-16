function fn() {
    var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }

    var config = {
        env: env,
        //myVarName: 'hello karate',
        baseUrl: 'https://gorest.co.in',
        //tokenID: '007526d9efdbc07e084ff7a6d4cfcc90588fbe20641c00faebf45a7f3b2eaf33'
        tokenID: '911aaf5ee36571799fbac3b8aa50f95c07dbf11fd904ae4a9ae65bac00a3bd7c'
    }

    if (env == 'dev') {
// customize
// e.g. config.foo = 'bar';
    } else if (env == 'e2e') {
// customize
    }
    return config;
}