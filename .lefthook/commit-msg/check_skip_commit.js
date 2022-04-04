import shell from 'shelljs';
import chalk from 'chalk';
import _ from 'lodash';

const log = console.log;
const {argv} = process;
const pathFileParameter = argv[2];
const path = './check_skip_commit/fake.js';

const commitMessageStr = shell.cat(pathFileParameter).toString();

const fakeMessageStr = shell.cat(path).toString();

console.log(commitMessageStr);
console.log(fakeMessageStr);
shell.rm(path);

if(_.trim(commitMessageStr) === _.trim(fakeMessageStr)) {
      log(chalk.green('commit-msg checked successfully with pre-commit is running'));
      process.exit(0);
} else {
      log(chalk.red('commit-msg please do not used parameter --no-verify in commit'));
      process.exit(1);
}

