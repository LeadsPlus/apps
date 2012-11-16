###
# ownCloud - News app
#
# @author Bernhard Posselt
# Copyright (c) 2012 - Bernhard Posselt <nukeawhale@gmail.com>
#
# This file is licensed under the Affero General Public License version 3 or later.
# See the COPYING-README file
#
###

angular.module('News').controller 'SettingsController', 
['Controller', '$scope', 'ShowAll', '$rootScope', 'PersistenceNews',
'FolderModel', 'FeedModel',
(Controller, $scope, ShowAll, $rootScope, PersistenceNews, FolderModel,
	FeedModel) ->

	class SettingsController extends Controller

		constructor: (@$scope, @$rootScope, @showAll, @persistence
						@folderModel, @feedModel) ->
			
			@add = false
			@settings = false

			@$scope.getShowAll = =>
				return @showAll.showAll

			@$scope.setShowAll = (value) =>
				@showAll.showAll = value
				@persistence.showAll(value)
				@$rootScope.$broadcast('triggerHideRead')

			@$scope.toggleSettings = =>
				if @add
					@add = false
				@settings = !@settings

			@$scope.toggleAdd = =>
				if @settings
					@settings = false
				@add = !@add

			@$scope.isExpanded = =>
				return  @settings || @add

			@$scope.addIsShown = =>
				return @add

			@$scope.settingsAreShown = =>
				return @settings

			@$scope.addFeed = (url) =>
				console.log url
				$scope.feedUrl = ""

			@$scope.addFolder = (name) =>
				#if @$scope.addFolderForm.$valid
				#	for folder in @folderModel.getItems()
				#		if name.toLowerCase() == folder.name.toLowerCase()
				#			@$scope.addFolderForm.$valid = false
				if name != ''
					@$scope.addFolderForm.folderName.$error = {required: false}
					@$scope.folderName = ''
				else 
					@$scope.addFolderForm.folderName.$error = {required: true}
				console.log name
				


	return new SettingsController($scope, $rootScope, ShowAll, 
									PersistenceNews, FolderModel, FeedModel)
]