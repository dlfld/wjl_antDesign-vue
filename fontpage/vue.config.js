module.exports = {
    // baseUrl: './',
    assetsDir: 'static',
    productionSourceMap: false,

    devServer: {
        proxy: {
            '/dev-api': {
                target: 'http://10.23.112.163:9090',
                changeOrigin: true,
                pathRewrite: {
                    '/dev-api': ''
                }
            }
        }
    }
}
