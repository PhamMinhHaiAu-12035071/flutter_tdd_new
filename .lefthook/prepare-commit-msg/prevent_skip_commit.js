import shell from 'shelljs';
import chalk from 'chalk';

const log = console.log;
const {argv} = process;
const pathFileParameter = argv[2];
const commitMessageStr = shell.cat(pathFileParameter).toString();

let countFile = 0;
const path = './check_skip_commit/fake.js';
shell.ls(path).forEach((file) => {
    countFile++;
})
if(countFile > 0) {
    log(chalk.green('prepare-commit-msg checked successfully\nyou do not used parameter --no-verify in commit'));
    shell.echo(commitMessageStr).to(path);
    process.exit(0);
} else {
    log(chalk.red('prepare-commit-msg please do not used parameter --no-verify in commit'));
    process.exit(1);
}