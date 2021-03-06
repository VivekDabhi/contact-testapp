// const { environment } = require('@rails/webpacker')

// module.exports = environment

const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
	// $: 'jquery',
	// jQuery: 'jquery',
	Popper: ['popper.js', 'default'],
	$: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery'
	// $: 'jquery/src/jquery',
 	//  jQuery: 'jquery/src/jquery',
 	//  jquery: 'jquery',
 	//  'window.jQuery': 'jquery',
 	//  Popper: ['popper.js', 'default']
}))

module.exports = environment