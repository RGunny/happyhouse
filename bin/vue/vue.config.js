module.exports = {  
  outputDir: "../src/main/resources/static",  // Location where files are created when building with npm run build
  indexPath: "../static/index.html",   // Specifies the location where the index.html file will be created
  devServer: {  
    proxy: "http://localhost:7777"  // address of Spring Boot WAS.
  },  
  chainWebpack: config => {  
    const svgRule = config.module.rule("svg");    
    svgRule.uses.clear();    
    svgRule.use("vue-svg-loader").loader("vue-svg-loader");  
  }  
};