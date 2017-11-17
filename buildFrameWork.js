
var os = require('os');
var path = require('path');
var process = require('process');
var childProcess = require('child_process');
var fs = require('fs');

// 系统用户目录
var usrFolder = os.homedir();
// xcode缓存目录
var xcodeDerivedDataFolder = path.join(usrFolder,'Library/Developer/Xcode/DerivedData');

// productFolder指的是xcode build生成文件的目录，可根据外部命令参数传递
var productFolder = `${xcodeDerivedDataFolder}/LoginUI-djmwazueazvyzgabzmuyspdyvlsu/Build/Products`;
if (process.argv[2]) {
    productFolder = process.argv[2];
    console.log(`set productFolder: ${productFolder}`);
}

// build静态库target名字
var targetProductName = 'ZYXFramework';
if (process.argv[3]) {
    targetProductName = process.argv[3];
    console.log(`set targetProductName: ${targetProductName}`);
}

// 切换要执行lipo命令的目录
process.chdir(productFolder);
var currentExecDir = process.cwd();
// console.log(currentExecDir);

var simulatorLib = `${currentExecDir}/Release-iphonesimulator/${targetProductName}.framework/${targetProductName}`;
var iphoneosLib = `${currentExecDir}/Release-iphoneos/${targetProductName}.framework/${targetProductName}`;

var outputfile = `${usrFolder}/Desktop/${targetProductName}`;


var execShell = 'lipo -create ' + simulatorLib + ' ' + iphoneosLib + ' -output ' + outputfile;


var p = new Promise((resolve, reject) => {
    childProcess.exec(execShell,(error, stdout, stderr) => {
        if (error) {
            reject(error);
        }
        if (fs.existsSync(outputfile)) {
            resolve(stdout);
        }
    });
}).then((stdout) => {

    console.log(fs.statSync(outputfile).birthtime.toString());
    // console.log(path.dirname(simulatorLib));

    let src = path.dirname(simulatorLib);
    let des = `${usrFolder}/Desktop/${targetProductName}.framework`;

    if (fs.statSync(src).isDirectory()) { //ZYXFramework.framework其实是个文件夹
        copyDir(src,des,() => {
            var desFileName = `${des}/${targetProductName}`;
            fs.copyFileSync(outputfile, desFileName);
        });
    }

},(err) => {
    console.log('exec error: ' + error);
})






function walk(current) {
    if (!fs.lstatSync(current).isDirectory()) {
        return [current];
    }

    const files = fs.readdirSync(current).map(child => {
        child = path.join(current, child);
        return walk(child);
    });
    return [].concat.apply([current], files);
}



function copyDir(srcDir, destDir,done) {
    if (!srcDir) { throw new Error('Need a path to copy from'); }
    if (!destDir) { throw new Error('Need a path to copy to'); }

    walk(srcDir).forEach(absoluteSrcFilePath => {

        const relativeFilePath = path.relative(srcDir, absoluteSrcFilePath);
        const destPath = path.resolve(destDir, relativeFilePath);

        if (fs.lstatSync(absoluteSrcFilePath).isDirectory()) {
            if (!fs.existsSync(destPath)) {
                fs.mkdirSync(destPath);
            }
            // Not recursive
            return;
        }

        copyBinaryFile(absoluteSrcFilePath, destPath, (err) => {
            if (err) { throw err; }
            done();
        });
    });
}

function copyBinaryFile(srcPath, destPath, cb) {
    let cbCalled = false;
    const srcPermissions = fs.statSync(srcPath).mode;
    const readStream = fs.createReadStream(srcPath);
    readStream.on('error', function(err) {
        done(err);
    });
    const writeStream = fs.createWriteStream(destPath, {
        mode: srcPermissions
    });
    writeStream.on('error', function(err) {
        done(err);
    });
    writeStream.on('close', function(ex) {
        done();
    });
    readStream.pipe(writeStream);
    function done(err) {
        if (!cbCalled) {
            cb(err);
            cbCalled = true;
        }
    }
}


