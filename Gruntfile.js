/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    regarde: {
      app: {
        files: ['web/dart/**/*.dart', 'test/**/*_test.dart', '!**/*.swp'],
        tasks: ['exec']
      }
    },
    exec: {
      test: {
        cmd: 'dart --checked test/all.dart'
      }
    }
  });

  // Default task.
  grunt.registerTask('default', 'regarde');

  // Load Dependencies
  grunt.loadNpmTasks('grunt-regarde');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-exec');

};
