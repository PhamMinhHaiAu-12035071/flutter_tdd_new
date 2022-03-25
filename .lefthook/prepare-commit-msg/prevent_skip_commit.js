import shell from 'shelljs';
import chalk from 'chalk';

const log = console.log;
const {argv} = process;
const pathFileParameter = argv[2];
const commitMessageStr = shell.cat(pathFileParameter);

console.log(`content commit in hook prepare-commit-msg: ${commitMessageStr.toString()}`);