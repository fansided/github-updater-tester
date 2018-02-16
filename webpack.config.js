const path = require( 'path' )
const webpack = require( 'webpack' )

module.exports = {
	entry: {
		app: path.resolve( __dirname, './assets/scripts/index.js' )
	},

	module: {
		rules: [
			{
				test: /\.(js)$/,
				use: ['babel-loader'],
				exclude: /node_modules/
			}
		]
	},

	output: {
		path: path.resolve( __dirname, './dist/scripts' ),
		filename: '[name].js'
	}
}