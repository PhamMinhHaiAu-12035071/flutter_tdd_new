import chalk from 'chalk';
import shell from 'shelljs';
import _ from 'lodash';

const log = console.log;
const gitExec = shell.which('git');

const resultCommandGitFileChanged = shell.exec(`${gitExec.stdout} diff-index --cached HEAD | awk '{print $(NF)}'`);
const arrFileChanged = resultCommandGitFileChanged.split('\n');
const compactArrFileChanged = _.compact(arrFileChanged);
const reg = new RegExp(/^lib\/playground.+$/, 'gm');
const checkedIgnoreFolderPlayground = compactArrFileChanged.every(str => reg.test(str) == false);
if(checkedIgnoreFolderPlayground) {
    log(chalk.green('pre-commit ignore folder playground valid'));
    process.exit(0);
} else {
    log(chalk.red('pre-commit please do not changed folder lib/playground'));
    process.exit(1);
}