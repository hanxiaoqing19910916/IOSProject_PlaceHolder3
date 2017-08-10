NodeJs中process.cwd()与__dirname的区别

process.cwd() 是当前执行node命令时候的文件夹地址 ——工作目录，保证了文件在不同的目录下执行时，路径始终不变
__dirname 是被执行的js 文件的地址 ——文件所在目录

Nodejs官方文档上的解释：

process.cwd(): The process.cwd() method returns the current working directory of the Node.js process.

意思很明了啦，就是说process.cwd()返回的是当前Node.js进程执行时的工作目录

那么来看看__dirname的官方解释：

__dirname: 当前模块的目录名。 等同于 __filename 的 path.dirname()。__dirname 实际上不是一个全局变量，而是每个模块内部的。


