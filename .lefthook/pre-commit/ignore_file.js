import chalk from 'chalk';

const log = console.log;
const {argv} = process;
// git diff-index --cached HEAD
log(chalk.green('Hello', 'world' + '!'));