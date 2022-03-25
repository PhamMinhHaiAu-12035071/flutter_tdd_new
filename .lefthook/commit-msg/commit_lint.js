import shell from 'shelljs';
import chalk from 'chalk';

const log = console.log;
const {argv} = process;
const pathFileParameter = argv[2];
const commitMessageStr = shell.cat(pathFileParameter);
console.log(`content commit in hook commit-msg: ${commitMessageStr.toString()}`);
const reg = new RegExp(/^(feat|build|chore|ci|docs|fix|perf|refactor|revert|style|test):.+/, 'gm');
if(reg.test(commitMessageStr.toString())) {
    log(chalk.green('commit message is valid'))
    process.exit(0);
} else {
    log(chalk.red('commit message is invalid \n commit should start with (feat|build|chore|ci|docs|fix|perf|refactor|revert|style|test)'));
    process.exit(1);
}