import shell from 'shelljs';
import chalk from 'chalk';

const log = console.log;

shell.touch('./check_skip_commit/fake.js');

log(chalk.green('checked pre-commit running successfully/'));
process.exit(0);