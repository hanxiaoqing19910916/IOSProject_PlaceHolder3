
var os = require('os');
var path = require('path');
var process = require('process');
var childProcess = require('child_process');
var fs = require('fs');



var usrFolder = os.homedir();

var xcodeDerivedDataFolder = path.join(usrFolder,'Library/Developer/Xcode/DerivedData');
var productFolder = xcodeDerivedDataFolder + '/LoginUI-djmwazueazvyzgabzmuyspdyvlsu/Build/Products';

process.chdir(productFolder);

var currentExecDir = process.cwd();
console.log(currentExecDir);

var simulatorLib = currentExecDir +'/Release-iphonesimulator/ZYXFramework.framework/ZYXFramework';
var iphoneosLib = currentExecDir +'/Release-iphoneos/ZYXFramework.framework/ZYXFramework';
var outputfile = usrFolder + '/Desktop/ZYXFramework';

var execShell = 'lipo -create ' + simulatorLib + ' ' + iphoneosLib + ' -output ' + outputfile;
childProcess.exec(execShell,function (error, stdout, stderr) {
    if (error !== null) {
        console.log('exec error: ' + error);
        return;
    }
    if (fs.existsSync(outputfile)) {
        console.log(fs.statSync(outputfile).birthtime.toString());

        var src = currentExecDir +'/Release-iphoneos/ZYXFramework.framework';
        var des = usrFolder + '/Desktop/ZYXFramework.framework';

        if (fs.statSync(src).isDirectory()) { //ZYXFramework.framework其实是个文件夹
            copyDir(src,des,() => {
                fs.copyFileSync(outputfile, des + '/ZYXFramework');
            });
        }
    }

});




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


