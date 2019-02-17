var http = require("http"); 

var options = {
    host: "localhost",
    path: "/signin",
    port: 3000,
    timeout : 3000
};

var request = http.get(options, (res) => {
    console.log(`STATUS: ${res.statusCode}`);
    if (res.statusCode == 200){
      var body = '';
      res.on('data', function(chunk) {
        body+=chunk;
      });
      res.on('end', function(){
        if (body.search(process.env.NOTEJAM_VER)>=0){
          console.log(`VERSION: ${process.env.NOTEJAM_VER}`);
          process.exit(0);
        }
        else {
          console.log(`VERSION: ${process.env.NOTEJAM_VER} NOT PRESENT`);
          process.exit(1);
        }
      });
    }
});

request.on('error',function(err) {
    console.log(err);
    process.exit(1);
});

request.end();
