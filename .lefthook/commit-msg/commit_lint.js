const shell = require('shelljs');

const {argv} = process;
const pathFileParameter = argv[2];
const commitMessageStr = shell.cat(pathFileParameter);
const reg = new RegExp(/^(feat|build|chore|ci|docs|fix|perf|refactor|revert|style|test):.+/, 'gm');
if(reg.test(commitMessageStr.toString())) {
    console.log('commit message is valid');
    process.exit(0);
} else {
    console.log('commit message is invalid \n commit should start with (feat|build|chore|ci|docs|fix|perf|refactor|revert|style|test)');
    process.exit(1);
}