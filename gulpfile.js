const { series, src } = require('gulp');
const { spawn } = require('child_process');
const through2 = require('through2');
const path = require('path');

// Define a custom function to run the morphir-elm make command
function runMorphirElmMake(project, outputPath) {
  return function (done) {
    const command = 'morphir-elm';
    const options = ['make', '-p', project, '-o', outputPath];

    // Spawn the morphir-elm process
    const morphirElmProcess = spawn(command, options, { stdio: 'inherit' });

    // Log the command being executed (optional)
    console.log(`Running command: ${command} ${options.join(' ')}`);

    // Handle the process exit
    morphirElmProcess.on('close', (code) => {
      if (code === 0) {
        console.log('Command completed successfully.');
        done();
      } else {
        console.error(`Command failed with code ${code}.`);
        done(new Error(`Command failed with code ${code}.`));
      }
    });
  };
}

function buildDecorations(cb) {
  return runMorphirElmMake('decorations/', 'out/morphir-decorations-ir.json')(cb);
}

function buildModels(cb) {
  return runMorphirElmMake('.', 'morphir-ir.json')(cb);
}

exports.buildDecorations = buildDecorations;
exports.build = series(buildDecorations, buildModels);
exports.default = exports.build;
