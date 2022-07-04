// https://karatelabs.github.io/karate/#configuration

function fn() {

    var env = karate.env; // get java system property 'karate.env'
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'uat'; // a custom 'intelligent' default
    }
    var config = {
        refDataService: 'https://refdataservice.chinacloudsites.cn',
        securityAndLoggingService: 'https://securityandloggingservice.chinacloudsites.cn'
    };

    if (env === 'poc') {
        // over-ride only those that need to be
        config.refDataService = 'https://refdataservice.chinacloudsites.cn'
        config.securityAndLoggingService = 'https://securityandloggingservice.chinacloudsites.cn'
    } else if (env === 'dev') {
        config.refDataService = 'https://app-refdata-svc-dev.chinacloudsites.cn'
        config.securityAndLoggingService = 'https://app-securitlog-svc-dev.chinacloudsites.cn'
    } else if (env === 'uat') {
        config.refDataService = 'https://boss-az-cn-dev.inside.ups.com/rds-api'
        config.securityAndLoggingService = 'https://boss-az-cn-dev.inside.ups.com/sls-api'
    } else if (env === 'prod') {

    } else if (env === 'dr') {

    }

    var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature',config).accessToken
    karate.configure('headers', {
        Authorization: 'Bearer ' + accessToken,
        'Ocp-Apim-Subscription-Key': '3c5fa49ca29944199343fb89813d4462'
    })
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    return config;
}
