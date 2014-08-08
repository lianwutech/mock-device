module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('_public/package.json'),
    nodewebkit: {
      options: {
        version: "0.8.6",
        build_dir: './dist',
        // specifiy what to build
        mac: true,
        win: false,
        linux32: false,
        linux64: false
      },
      src: [
        './_public/**/*',
        './node_modules/mqtt/**/*'
      ]
    }
  });

  grunt.loadNpmTasks('grunt-node-webkit-builder');

  grunt.registerTask('default', ['nodewebkit']);
};
