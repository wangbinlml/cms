const crypto = require("crypto");
const fs = require("fs");
const axios = require("axios");
const key = 'OxLYdFmu3YS1haMUcaBmGMBK0P7PbOqb'; //百度api的key
const PASSWORD_SALT = "xxdddffffff";
const SYSTEM_PASSWORD_SALT = "cmsxxx";

/**
 * 根据指定字符串生成加密后的密码<br />
 * 加密方式:将密码+固定盐值（SALT）先进行md5得到二进制字节数组后再进行Base64加密得到密文结果
 * @param password 明文密码
 * @returns 加密密码
 */
module.exports.generatePassword = function (password) {
    return crypto.createHash("md5").update(password + PASSWORD_SALT).digest("base64");
};


/**
 * 随机生成头像背景色
 * @returns {string}背景色
 */
module.exports.generateHeadColor = function () {
    return HEAD_COLOR_ARR[Math.floor(Math.random() * HEAD_COLOR_ARR.length)];
};


/**
 * 根据指定的字符串生成本系统所需加密密码
 * @param str 字符串
 * @returns {string}加密密码
 */
module.exports.createPassword = function (str) {
    return crypto.createHash("md5").update(str + SYSTEM_PASSWORD_SALT).digest("base64");
};


module.exports.md5 = function (text) {
    return crypto.createHash('md5').update(text).digest('hex');
};

/*3.用正则表达式实现html转码*/
module.exports.htmlEncodeByRegExp = function (str){
    let s = "";
    if(str.length == 0) return "";
    s = str.replace(/&/g,"&amp;");
    s = s.replace(/</g,"&lt;");
    s = s.replace(/>/g,"&gt;");
    s = s.replace(/ /g,"&nbsp;");
    s = s.replace(/\'/g,"&#39;");
    s = s.replace(/\"/g,"&quot;");
    return s;
}
/*4.用正则表达式实现html解码*/
module.exports.htmlDecodeByRegExp = function (str){
    let s = "";
    if(str.length == 0) return "";
    s = str.replace(/&amp;/g,"&");
    s = s.replace(/&lt;/g,"<");
    s = s.replace(/&gt;/g,">");
    s = s.replace(/&nbsp;/g," ");
    s = s.replace(/&#39;/g,"\'");
    s = s.replace(/&quot;/g,"\"");
    return s;
};
module.exports.isModuleName = function(moduleName) {
    if(/^[a-z0-9_-]+$/ui.test(moduleName)) {
        return true;
    }
    return false;
}

/*
 * 递归遍历
 * @param data array
 * @param id int
 * return array
 * */
let recursion = function(data, id) {
    let list = [];
    for(let index in data) {
        let v = data[index];
        if(v['parent_id'] == id) {
            v['children'] = recursion(data, v['id']);
            if(v['children'].length == 0) {
                //unset(v['son']);
            }
            list.push(v);
        }
    }
    return list;
}
module.exports.recursion = recursion;

/*
 * 遍历文件夹，获取所有文件夹里面的文件信息
 * @param path 路径
 *
 */

function geFileList(path)
{
    let filesList = [];
    let targetObj = {};
    readFile(path,filesList,targetObj);
    return filesList;
}
//遍历读取文件
let readFile = function(path,filesList,targetObj)
{
    files = fs.readdirSync(path);//需要用到同步读取
    files.forEach(walk);
    function walk(file)
    {
        states = fs.statSync(path+'/'+file);
        if(states.isDirectory())
        {
            let item ;
            if(targetObj["children"])
            {
                item = {name:file,children:[]};
                targetObj["children"].push(item);
            }
            else
            {
                item = {name:file,children:[]};
                filesList.push(item);
            }

            readFile(path+'/'+file,filesList,item);
        }
        else
        {
            //创建一个对象保存信息
            let obj = new Object();
            obj.size = states.size;//文件大小，以字节为单位
            obj.name = file;//文件名
            obj.path = path+'/'+file; //文件绝对路径

            if(targetObj["children"])
            {
                let item = {name:file,value:obj.path}
                targetObj["children"].push(item);
            }
            else
            {
                let item = {name:file,value:obj.path};
                filesList.push(item);
            }
        }
    }
}

module.exports.geFileList = geFileList;
let renderFileSync = function(ejs, filename, data, options, cb){
    if (typeof cb == "function") {
        ejs.renderFile(filename, data, options, function (err, str) {
            if (err) {
                throw err;
            }
            cb(null, str);
        });
    } else {
        return new Promise((resolve, reject) => {

            ejs.renderFile(filename, data, options, function (err, str) {
                if (err) {
                    reject(err);
                }
                resolve(str);
            });
        });
    }
};
module.exports.renderFileSync  = renderFileSync;

module.exports.getLocations = async function (ip) {
    var ip = ip ? ip.replace("::ffff:", "") : "";
    if (ip) {
        // 向远程服务器端发送请求
        var str = await axios.get('https://api.map.baidu.com'+'/location/ip?ak=' + key + "&coor=bd09ll&ip=" + ip, "");
        if (str.status == 200 && str.data.status !=2 && str.data.status !=1) {
            return JSON.stringify(str.data);
        }
        return "";
    } else {
        return "";
    }
};
