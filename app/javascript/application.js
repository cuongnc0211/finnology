// Entry point for the build script in your package.json
import "trix"
import "@rails/actiontext"
import * as bootstrap from 'bootstrap'

import './src/add_jquery'
import './src/jquery-ui'

$(function() {
  console.log('hello from jquery');
})
