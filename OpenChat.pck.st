'From Cuis 5.0 [latest update: #4384] on 25 November 2020 at 7:43:35 am'!
'Description Primer version - Falta el recepcionist'!
!provides: 'OpenChat' 1 0!
SystemOrganization addCategory: 'OpenChat'!


!classDefinition: #ModelException category: 'OpenChat'!
Error subclass: #ModelException
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'ModelException class' category: 'OpenChat'!
ModelException class
	instanceVariableNames: ''!

!classDefinition: #OpenChatSystemTest category: 'OpenChat'!
TestCase subclass: #OpenChatSystemTest
	instanceVariableNames: 'testObjects system'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'OpenChatSystemTest class' category: 'OpenChat'!
OpenChatSystemTest class
	instanceVariableNames: ''!

!classDefinition: #PublisherTest category: 'OpenChat'!
TestCase subclass: #PublisherTest
	instanceVariableNames: 'testObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'PublisherTest class' category: 'OpenChat'!
PublisherTest class
	instanceVariableNames: ''!

!classDefinition: #UserTest category: 'OpenChat'!
TestCase subclass: #UserTest
	instanceVariableNames: 'testObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'UserTest class' category: 'OpenChat'!
UserTest class
	instanceVariableNames: ''!

!classDefinition: #LoadExample category: 'OpenChat'!
Object subclass: #LoadExample
	instanceVariableNames: 'userNamePrefix followers userName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'LoadExample class' category: 'OpenChat'!
LoadExample class
	instanceVariableNames: ''!

!classDefinition: #ManualClock category: 'OpenChat'!
Object subclass: #ManualClock
	instanceVariableNames: 'now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'ManualClock class' category: 'OpenChat'!
ManualClock class
	instanceVariableNames: ''!

!classDefinition: #OpenChatSystem category: 'OpenChat'!
Object subclass: #OpenChatSystem
	instanceVariableNames: 'userCards clock likersByPublication'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'OpenChatSystem class' category: 'OpenChat'!
OpenChatSystem class
	instanceVariableNames: ''!

!classDefinition: #Publication category: 'OpenChat'!
Object subclass: #Publication
	instanceVariableNames: 'publisher message publicationTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'Publication class' category: 'OpenChat'!
Publication class
	instanceVariableNames: ''!

!classDefinition: #Publisher category: 'OpenChat'!
Object subclass: #Publisher
	instanceVariableNames: 'user followers publications'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'Publisher class' category: 'OpenChat'!
Publisher class
	instanceVariableNames: ''!

!classDefinition: #TestObjectsBucket category: 'OpenChat'!
Object subclass: #TestObjectsBucket
	instanceVariableNames: 'clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'TestObjectsBucket class' category: 'OpenChat'!
TestObjectsBucket class
	instanceVariableNames: ''!

!classDefinition: #User category: 'OpenChat'!
Object subclass: #User
	instanceVariableNames: 'name about homePage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'User class' category: 'OpenChat'!
User class
	instanceVariableNames: ''!

!classDefinition: #UserCard category: 'OpenChat'!
Object subclass: #UserCard
	instanceVariableNames: 'user password publisher'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'UserCard class' category: 'OpenChat'!
UserCard class
	instanceVariableNames: ''!


!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 17:20:58'!
test01_createSystemHasNoUsers

	system := self createSystem.
	
	self deny: system hasUsers.
	self deny: (system hasUserNamed: testObjects pepeSanchezName).
	self assert: 0 equals: system numberOfUsers
	! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 17:26:11'!
test02_canRegisterUser

	| registeredUser |
	
	system := self createSystem.
	registeredUser := self registerPepeSanchez.
	
	self assert: system hasUsers.
	self assert: (system hasUserNamed: testObjects pepeSanchezName).
	self assert: 1 equals: system numberOfUsers.
	
	self assert: (registeredUser isNamed: testObjects pepeSanchezName).
	self assert: testObjects pepeSanchezAbout equals: registeredUser about.
	self assert: testObjects pepeSanchezHomePage equals: registeredUser homePage.
	self deny: testObjects pepeSanchezHomePage,'x' = registeredUser homePage.
	! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 17:34:09'!
test03_canRegisterManyUsers

	system := self createSystem.
	self registerPepeSanchez.
	self registerJuanPerez.
	
	self assert: system hasUsers.
	self assert: (system hasUserNamed: testObjects pepeSanchezName).
	self assert: (system hasUserNamed: testObjects juanPerezName).
	self assert: 2 equals: system numberOfUsers.
	! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 17:39:02'!
test04_canNotRegisterSameUserTwice
	
	system := self createSystem.
	self registerPepeSanchez.
	
	self 
		should: [ self registerPepeSanchez ]
		raise: ModelException - MessageNotUnderstood 
		withExceptionDo: [ :aModelException |
			self assert: system canNotRegisterSameUserTwice equals: aModelException messageText.
			
			self assert: system hasUsers.
			self assert: (system hasUserNamed: testObjects pepeSanchezName).
			self assert: 1 equals: system numberOfUsers ]! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:13:52'!
test05_canWorkWithAuthenticatedUser
	
	| token authenticatedToken |
	
	system := self createSystem.
	self registerPepeSanchez.
	
	token := Object new.
	authenticatedToken := system 
		authenticate: testObjects pepeSanchezName
		with: testObjects pepeSanchezPassword 
		andDo: [ :anUser | token ]
		ifFail: [ self fail ].
		
	self assert: token equals: authenticatedToken! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:20:09'!
test06_notRegisteredUserIsNotAuthenticated
	
	system := self createSystem.
	self assertCanNotAuthenticaPepeSanchezWith: testObjects pepeSanchezPassword ! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:21:34'!
test07_canNotAuthenticateWithInvalidPassword
	
	system := self createSystem.
	self registerPepeSanchez.
	
	self assertCanNotAuthenticaPepeSanchezWith: testObjects pepeSanchezPassword,'x' ! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:29:39'!
test08_registeredUserCanPublish
	
	| publication timeline |
	
	system := self createSystem.
	self registerPepeSanchez.
	
	publication := system publish: 'hello' forUserNamed: testObjects pepeSanchezName.
	
	timeline := system timelineOfUserNamed: testObjects pepeSanchezName.
	
	self assert: 1 equals: timeline size.
	self assert: publication equals: timeline first! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:30:47'!
test09_noRegisteredUserCanNotPublish
	
	system := self createSystem.
	
	self 
		should: [ system publish: 'hello' forUserNamed: testObjects pepeSanchezName ]
		raise: ModelException - MessageNotUnderstood 
		withMessageText: system userNotRegistered! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:29:39'!
test10_noRegisteredUserCanAskItsTimeline
	
	system := self createSystem.
	
	self 
		should: [ system timelineOfUserNamed: testObjects pepeSanchezName ]
		raise: ModelException - MessageNotUnderstood 
		withMessageText: system userNotRegistered! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:41:44'!
test11_canFollowRegisteredUser
	
	| follower followers |
	
	system := self createSystem.
	self registerPepeSanchez.
	follower := self registerJuanPerez.
	
	system userNamed: testObjects juanPerezName follows: testObjects pepeSanchezName.
	
	followers := system followersOfUserNamed: testObjects pepeSanchezName.
	
	self assert: 1 equals: followers size.
	self assert: follower equals: followers first! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:04:09'!
test12_canGetWallOfRegisteredUser
	
	| followedPublication followerPublication wall |
	
	system := self createSystem.
	self registerPepeSanchez.
	self registerJuanPerez.
	
	system userNamed: testObjects juanPerezName follows: testObjects pepeSanchezName.
	followedPublication := system publish: 'hello' forUserNamed: testObjects pepeSanchezName.
	testObjects advanceTimeBy: 1*second.
	followerPublication := system publish: 'bye' forUserNamed: testObjects juanPerezName.
	
	wall := system wallOfUserNamed: testObjects pepeSanchezName.
	
	self assert: 2 equals: wall size.
	self assert: followerPublication equals: wall first.
	self assert: followedPublication equals: wall second.
	! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:08:31'!
test13_publicationsHaveNoLikesWhenCreated
	
	| publication likes |
	
	system := self createSystem.
	self registerPepeSanchez.
	
	publication := system publish: 'hello' forUserNamed: testObjects pepeSanchezName.
	
	likes := system likesOf: publication.
	self assert: 0 equals: likes
	! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:10:04'!
test14_registeredUserCanLikePublication
	
	| publication likes |
	
	system := self createSystem.
	self registerPepeSanchez.
	self registerJuanPerez.
	
	publication := system publish: 'hello' forUserNamed: testObjects pepeSanchezName.
	system liked: publication by: testObjects juanPerezName.
	
	likes := system likesOf: publication.
	self assert: 1 equals: likes
	! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:20:45'!
test15_canNotLikeNotPublishPublication
	
	| publication registeredUser |
	
	system := self createSystem.
	registeredUser := self registerPepeSanchez.
	
	publication := Publication madeBy: (Publisher relatedTo: registeredUser) about: 'something' at: testObjects now.
	self 
		should: [ system liked: publication by: testObjects juanPerezName ]
		raise: ModelException - MessageNotUnderstood 
		withMessageText: system invalidPublication
	
	! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:23:30'!
test16_likesByUserCountOnlyOnce
	
	| publication likes |
	
	system := self createSystem.
	self registerPepeSanchez.
	self registerJuanPerez.
	
	publication := system publish: 'hello' forUserNamed: testObjects pepeSanchezName.
	system liked: publication by: testObjects juanPerezName.
	likes := system liked: publication by: testObjects juanPerezName.
	
	self assert: 1 equals: likes.
	self assert: 1 equals: (system likesOf: publication)
	! !

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:25:51'!
test17_notRegisteredUserCanNotLikePublication
	
	| publication |
	
	system := self createSystem.
	self registerPepeSanchez.
	
	publication := system publish: 'hello' forUserNamed: testObjects pepeSanchezName.
	self 
		should: [ system liked: publication by: testObjects juanPerezName ]
		raise: ModelException - MessageNotUnderstood 
		withExceptionDo: [ :aModelException |
			self assert: system userNotRegistered equals: aModelException messageText.
			self assert: 0 equals: (system likesOf: publication) ]! !

!OpenChatSystemTest methodsFor: 'setUp/tearDown' stamp: 'HAW 11/22/2020 19:54:36'!
createSystem
	
	^OpenChatSystem timingWith: testObjects clock! !

!OpenChatSystemTest methodsFor: 'setUp/tearDown' stamp: 'HAW 11/22/2020 17:34:59'!
registerJuanPerez
	
	^system 
		registerUserNamed: testObjects juanPerezName 
		authenticatedWith: testObjects juanPerezPassword
		with: testObjects juanPerezAbout 
		at: testObjects juanPerezHomePage ! !

!OpenChatSystemTest methodsFor: 'setUp/tearDown' stamp: 'HAW 11/22/2020 17:27:36'!
registerPepeSanchez
	
	^system 
		registerUserNamed: testObjects pepeSanchezName 
		authenticatedWith: testObjects pepeSanchezPassword
		with: testObjects pepeSanchezAbout 
		at: testObjects pepeSanchezHomePage ! !

!OpenChatSystemTest methodsFor: 'setUp/tearDown' stamp: 'HAW 11/22/2020 17:21:59'!
setUp

	testObjects := TestObjectsBucket new! !

!OpenChatSystemTest methodsFor: 'assertions' stamp: 'HAW 11/22/2020 19:18:04'!
assertCanNotAuthenticaPepeSanchezWith: aPassword

	system 
		authenticate: testObjects pepeSanchezName 
		with: aPassword 
		andDo: [ :user | self fail ]
		ifFail: [ ]! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:48:13'!
test01_createdPublisherHasNoFollowers

	| createdPublisher |
	
	createdPublisher := self createPepeSanchez.
	
	self deny: createdPublisher hasFollowers! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:43:52'!
test02_publisherCanFollowOtherPublisher

	| followed follower |
	
	followed := self createPepeSanchez.
	follower := self createJuanPerez.
	
	followed followedBy: follower.
	
	self assert: followed hasFollowers.
	self assert: (followed isFollowedBy: follower).
	self assert: 1 equals: followed numberOfFollowers
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:43:18'!
test03_publisherCanNotFollowSelf

	| follower |
	
	follower := self createPepeSanchez.
	
	self
		should: [ follower followedBy: follower ]
		raise: ModelException - MessageNotUnderstood 
		withExceptionDo: [ :aModelException |
			self assert: follower canNotFollowSelf equals: aModelException messageText.
			self deny: follower hasFollowers ]
	
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:45:43'!
test04_publisherCanNotFollowSamePublisherTwice

	| followed follower |
	
	followed := self createPepeSanchez.
	follower := self createJuanPerez.
	
	followed followedBy: follower.
	self 
		should: [ followed followedBy: follower ]
		raise: ModelException 
		withExceptionDo: [ :aModelException |
			self assert: followed canNotBeFollowedBySameFollowerTwice equals: aModelException messageText.
			self assert: (followed isFollowedBy: follower).
			self assert: 1 equals: followed numberOfFollowers ]
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 16:30:16'!
test05_createdPusblisherHasNoPublications

	| createdPusblisher |
	
	createdPusblisher := self createPepeSanchez.
	
	self deny: createdPusblisher hasPublications
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 16:38:33'!
test06_publisherCanPublishMessages

	| createdPusblisher message publication publicationTime |
	
	createdPusblisher := self createPepeSanchez.
	publicationTime := GregorianDateTime now.
	message := 'a message'.
	
	publication := createdPusblisher publish: message at: publicationTime.
	
	self assert: createdPusblisher hasPublications.
	self assert: (publication hasMessage: message).
	self assert: (publication wasPublishedAt: publicationTime).
	
	self deny: (publication hasMessage: message,'x').
	self deny: (publication wasPublishedAt: (publicationTime next: 1*second)).
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:06:36'!
test07_timelineHasPublisherPublicationsSortedWithLatestPublicationsFirst

	| createdPusblisher message firstPublication publicationTime secondPublication timeline |
	
	createdPusblisher := self createPepeSanchez.
	publicationTime := GregorianDateTime now.
	message := 'a message'.
	
	firstPublication := createdPusblisher publish: message at: publicationTime.
	secondPublication := createdPusblisher publish: message at: (publicationTime next: 1*second).
	
	timeline := createdPusblisher timeline.
	
	self assert: 2 equals: timeline size.
	self assert: secondPublication equals: timeline first.
	self assert: firstPublication equals: timeline second! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 16:45:36'!
test08_wallContainsPublisherPublications

	| createdPusblisher message firstPublication publicationTime timeline |
	
	createdPusblisher := self createPepeSanchez.
	publicationTime := GregorianDateTime now.
	message := 'a message'.
	
	firstPublication := createdPusblisher publish: message at: publicationTime.
	
	timeline := createdPusblisher wall.
	
	self assert: 1 equals: timeline size.
	self assert: firstPublication equals: timeline first.
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 19:47:11'!
test09_wallContainsFollowersPublications

	| followed message firstPublication publicationTime timeline follower |
	
	followed := self createPepeSanchez.
	follower := self createJuanPerez.
	followed followedBy: follower.
	
	publicationTime := GregorianDateTime now.
	message := 'a message'.
	
	firstPublication := follower publish: message at: publicationTime.
	
	timeline := followed wall.
	
	self assert: 1 equals: timeline size.
	self assert: firstPublication equals: timeline first.
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 20:06:54'!
test10_wallContainsFollowersPublicationsWithLatestPublicationsFirst

	| followed message firstPublication publicationTime timeline follower secondPublication thirdPublication |
	
	followed := self createPepeSanchez.
	follower := self createJuanPerez.
	followed followedBy: follower.
	
	publicationTime := GregorianDateTime now.
	message := 'a message'.
	
	firstPublication := followed publish: message at: publicationTime.
	secondPublication := follower publish: message at: (publicationTime next: 1*second).
	thirdPublication := followed publish: message at: (publicationTime next: 2*second).
	
	timeline := followed wall.
	
	self assert: 3 equals: timeline size.
	self assert: thirdPublication equals: timeline first.
	self assert: secondPublication equals: timeline second.
	self assert: firstPublication equals: timeline third.
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 16:58:10'!
test11_canNotPublishWithInappropriateWord

	| createdPublisher message publicationTime |
	
	createdPublisher := self createPepeSanchez.
	
	publicationTime := GregorianDateTime now.
	message := 'elephant'.
	
	self 
		should: [ createdPublisher publish: message at: publicationTime ]
		raise: ModelException - MessageNotUnderstood 
		withExceptionDo: [ :aModelException |
			self assert: Publication inappropriateWord equals: aModelException messageText.
			self deny: createdPublisher hasPublications ]
		
	
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 17:00:22'!
test12_canNotPublishWithInappropriateWordInUpperCase

	| createdPublisher message publicationTime |
	
	createdPublisher := self createPepeSanchez.
	
	publicationTime := GregorianDateTime now.
	message := 'ELEPHANT'.
	
	self 
		should: [ createdPublisher publish: message at: publicationTime ]
		raise: ModelException - MessageNotUnderstood 
		withExceptionDo: [ :aModelException |
			self assert: Publication inappropriateWord equals: aModelException messageText.
			self deny: createdPublisher hasPublications ]
		
	
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 17:01:13'!
test13_canNotPublishAMessageContainingInappropriateWord

	| createdPublisher message publicationTime |
	
	createdPublisher := self createPepeSanchez.
	
	publicationTime := GregorianDateTime now.
	message := 'abc ELEPHANT xx'.
	
	self 
		should: [ createdPublisher publish: message at: publicationTime ]
		raise: ModelException - MessageNotUnderstood 
		withExceptionDo: [ :aModelException |
			self assert: Publication inappropriateWord equals: aModelException messageText.
			self deny: createdPublisher hasPublications ]
		
	
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 17:03:11'!
test14_canNotPublishAnyInappropriateWord

	| createdPublisher inappropriatedWords publicationTime |
	
	createdPublisher := self createPepeSanchez.
	
	publicationTime := GregorianDateTime now.
	inappropriatedWords := { 'elephant'. 'orange'. 'ice cream' }.
	
	inappropriatedWords do: [ :inappropriateWord |
		self 
			should: [ createdPublisher publish: inappropriateWord at: publicationTime ]
			raise: ModelException - MessageNotUnderstood 
			withExceptionDo: [ :aModelException |
				self assert: Publication inappropriateWord equals: aModelException messageText.
				self deny: createdPublisher hasPublications ]]
	! !

!PublisherTest methodsFor: 'setUp/tearDown' stamp: 'HAW 11/22/2020 16:18:54'!
createJuanPerez
	
	^Publisher relatedTo: testObjects createJuanPerez! !

!PublisherTest methodsFor: 'setUp/tearDown' stamp: 'HAW 11/22/2020 16:13:38'!
createPepeSanchez
	
	^Publisher relatedTo: testObjects createPepeSanchez ! !

!PublisherTest methodsFor: 'setUp/tearDown' stamp: 'HAW 11/22/2020 16:13:38'!
setUp

	testObjects := TestObjectsBucket new! !

!UserTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 15:51:11'!
test01_canNotCreateUserWithBlankName

	self 
		should: [ User named: ' ' about: 'something' at: 'www.10pines.com' ]
		raise: ModelException - MessageNotUnderstood 
		withMessageText: User nameCanNotBeBlank! !

!UserTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 16:13:44'!
test02_canCreateUserWithNoBlankName

	| createdUser |
	
	createdUser := testObjects createPepeSanchez.
	
	self assert: (createdUser isNamed: testObjects pepeSanchezName)! !

!UserTest methodsFor: 'tests' stamp: 'HAW 11/22/2020 16:13:44'!
test03_isNamedReturnsFalseWhenAskedWithOtherName

	| createdUser |
	
	createdUser := testObjects createPepeSanchez.
	
	self deny: (createdUser isNamed: testObjects pepeSanchezName,'x')! !

!UserTest methodsFor: 'setUp/tearDown' stamp: 'HAW 11/22/2020 16:13:43'!
setUp

	testObjects := TestObjectsBucket new! !

!LoadExample methodsFor: 'load' stamp: 'HAW 11/25/2020 07:42:58'!
loadOn: aSystem with: aNumberOfUsers followers: aNumberOfFollowers publications: aNumberOfPublications

"
	Inspeccionar la siguiente linea:
	self new loadOn: (OpenChatSystem timingWith: GregorianDateTime) with: 1000 followers: 20 publications: 300
"

	| startStats endStats elapseTime |
	
	Smalltalk garbageCollect.
	startStats := Utilities vmStatisticsReportString.
	
	userNamePrefix := 'AAAAA'.
	followers := OrderedCollection new.
	
	elapseTime := Time millisecondsToRun: [
		1 to: aNumberOfUsers do: [ :currentUserIndex |
			self createUserNameWith: currentUserIndex.
			self registerUserIn: aSystem.
			self addFollowers: aNumberOfFollowers in: aSystem.
			self addPublications: aNumberOfPublications in: aSystem.
			self calculateUserNamePrefix: currentUserIndex ]].
	
	Smalltalk garbageCollect.	
	endStats := Utilities vmStatisticsReportString.
	
	^Array with: elapseTime with: startStats with: endStats ! !

!LoadExample methodsFor: 'load - private' stamp: 'HAW 11/24/2020 10:13:46'!
addFollowers: aNumberOfFollowers in: aSystem
	
	followers do: [:aFollower | aSystem userNamed: aFollower follows: userName ].
	
	followers add: userName.
	followers size > aNumberOfFollowers ifTrue: [ followers removeFirst ].! !

!LoadExample methodsFor: 'load - private' stamp: 'HAW 11/24/2020 18:29:21'!
addPublications: aNumberOfPublications in: aSystem
	
	| publicationMessage |
	
	publicationMessage := String streamContents: [ :stream |
		userName size timesRepeat: [ stream nextPutAll: userName ]].
	
	aNumberOfPublications timesRepeat: [ 
		aSystem publish: publicationMessage copy forUserNamed: userName ]! !

!LoadExample methodsFor: 'load - private' stamp: 'HAW 11/24/2020 10:45:30'!
calculateUserNamePrefix: currentUserIndex
	
	currentUserIndex \\ 26 = 0 ifTrue: [ userNamePrefix := userNamePrefix , 'A' ].! !

!LoadExample methodsFor: 'load - private' stamp: 'HAW 11/24/2020 10:49:25'!
createUserNameWith: currentUserIndex
	
	userName := userNamePrefix,(Character asciiValue: `$A asciiValue` + currentUserIndex \\ 26) asString
	
	! !

!LoadExample methodsFor: 'load - private' stamp: 'HAW 11/24/2020 10:07:58'!
registerUserIn: aSystem
	
	aSystem registerUserNamed: userName authenticatedWith: userName with: userName,userName,userName at: 'www.10pines.com'! !

!ManualClock methodsFor: 'initialization' stamp: 'HAW 11/22/2020 19:57:49'!
initializeAtNow: aNow 
	
	now := aNow.! !

!ManualClock methodsFor: 'time' stamp: 'HAW 11/22/2020 19:59:47'!
advanceTimeBy: aDelta

	now := now next: aDelta 
	! !

!ManualClock methodsFor: 'time' stamp: 'HAW 11/22/2020 20:00:22'!
now
	
	^now! !

!ManualClock class methodsFor: 'instance creation' stamp: 'HAW 11/22/2020 19:57:43'!
atNow: aNow

	^self new initializeAtNow: aNow! !

!OpenChatSystem methodsFor: 'assertions' stamp: 'HAW 11/22/2020 17:38:38'!
assertIsNotDuplicated: aUserName

	(self hasUserNamed: aUserName) ifTrue: [ ModelException signal: self canNotRegisterSameUserTwice ]! !

!OpenChatSystem methodsFor: 'assertions' stamp: 'HAW 11/22/2020 17:38:51'!
canNotRegisterSameUserTwice
	
	^'Username already in use.'! !

!OpenChatSystem methodsFor: 'assertions' stamp: 'HAW 11/22/2020 20:21:34'!
invalidPublication
	
	^'Invalid publication'! !

!OpenChatSystem methodsFor: 'assertions' stamp: 'HAW 11/22/2020 19:30:06'!
userNotRegistered
	
	^'User not registered'! !

!OpenChatSystem methodsFor: 'initialization' stamp: 'HAW 11/22/2020 20:13:10'!
initializeTimingWith: aClock 
	
	clock := aClock.
	userCards := Dictionary new.
	likersByPublication := Dictionary new! !

!OpenChatSystem methodsFor: 'publications' stamp: 'HAW 11/22/2020 20:15:44'!
liked: aPublication by: aUserName
 
	^(self likersOf: aPublication) 
		add: (self publisherForUserNamed: aUserName);
		size! !

!OpenChatSystem methodsFor: 'publications' stamp: 'HAW 11/22/2020 20:16:00'!
likesOf: aPublication 
	
	^(self likersOf: aPublication) size! !

!OpenChatSystem methodsFor: 'publications' stamp: 'HAW 11/22/2020 20:14:10'!
publish: aMessage forUserNamed: aUserName
 
	| publication |
	
	publication := (self publisherForUserNamed: aUserName) publish: aMessage at: self now.
	likersByPublication at: publication put: Set new.
	
	^publication 
	! !

!OpenChatSystem methodsFor: 'publications' stamp: 'HAW 11/22/2020 20:29:39'!
timelineOfUserNamed: aUserName

	^(self publisherForUserNamed: aUserName) timeline ! !

!OpenChatSystem methodsFor: 'publications' stamp: 'HAW 11/22/2020 19:52:29'!
wallOfUserNamed: aUserName

	^(self publisherForUserNamed: aUserName) wall! !

!OpenChatSystem methodsFor: 'publications - private' stamp: 'HAW 11/22/2020 20:21:51'!
likersOf: aPublication

	^ likersByPublication at: aPublication ifAbsent: [ ModelException signal: self invalidPublication ]! !

!OpenChatSystem methodsFor: 'testing' stamp: 'HAW 11/22/2020 17:32:05'!
hasUserNamed: aPotentialUserName

	^userCards includesKey: aPotentialUserName ! !

!OpenChatSystem methodsFor: 'testing' stamp: 'HAW 11/22/2020 17:31:34'!
hasUsers
	
	^userCards notEmpty ! !

!OpenChatSystem methodsFor: 'time' stamp: 'HAW 11/22/2020 20:00:15'!
now
	
	^clock now! !

!OpenChatSystem methodsFor: 'users' stamp: 'HAW 11/22/2020 19:19:45'!
authenticate: aUserName with: aPassword andDo: authenticatedBlock ifFail: failBlock
 
	userCards 
		at: aUserName 
		ifPresent: [ :userCard | 
			(userCard hasPassword: aPassword) ifTrue: [ ^authenticatedBlock value: userCard user ]].
	
	^failBlock value! !

!OpenChatSystem methodsFor: 'users' stamp: 'HAW 11/22/2020 19:40:58'!
followersOfUserNamed: aFollowedUserName

	^(self publisherForUserNamed: aFollowedUserName) followersCollect: [ :aFollower | aFollower relatedUser ]! !

!OpenChatSystem methodsFor: 'users' stamp: 'HAW 11/22/2020 17:31:42'!
numberOfUsers
	
	^userCards size! !

!OpenChatSystem methodsFor: 'users' stamp: 'HAW 11/22/2020 17:37:58'!
registerUserNamed: aUserName authenticatedWith: aPassword with: anAbout at: aHomePage
 
	| user |
	
	self assertIsNotDuplicated: aUserName.
	
	user := User named: aUserName about: anAbout at: aHomePage.
	userCards 
		at: aUserName 
		put: (UserCard of: user authenticatedWith: aPassword relatedTo: (Publisher relatedTo: user)).
		
	^user! !

!OpenChatSystem methodsFor: 'users' stamp: 'HAW 11/22/2020 19:43:18'!
userNamed: aFollowerUserName follows: aFollowedUserName 
	
	| followed follower |
	
	followed := self publisherForUserNamed: aFollowedUserName.
	follower := self publisherForUserNamed: aFollowerUserName.
	
	followed followedBy: follower! !

!OpenChatSystem methodsFor: 'users - private' stamp: 'HAW 11/22/2020 20:29:21'!
publisherForUserNamed: aUserName

	^userCards 
		at: aUserName 
		ifPresent: [ :userCard | userCard publisher ]
		ifAbsent: [ ModelException signal: self userNotRegistered ]! !

!OpenChatSystem class methodsFor: 'instance creation' stamp: 'HAW 11/22/2020 19:58:09'!
timingWith: aClock 
	
	^self new initializeTimingWith: aClock ! !

!Publication methodsFor: 'initialization' stamp: 'HAW 11/22/2020 16:37:10'!
initializeMadeBy: aPublisher about: aMessage at: aPublicationTime 
	
	publisher := aPublisher.
	message := aMessage.
	publicationTime := aPublicationTime.! !

!Publication methodsFor: 'time' stamp: 'HAW 11/22/2020 16:43:37'!
publicationTime
	
	^publicationTime! !

!Publication methodsFor: 'testing' stamp: 'HAW 11/22/2020 16:37:42'!
hasMessage: aMessage

	^message = aMessage ! !

!Publication methodsFor: 'testing' stamp: 'HAW 11/22/2020 20:05:26'!
wasPublishedAfter: aPublication 
	
	^publicationTime >= aPublication publicationTime! !

!Publication methodsFor: 'testing' stamp: 'HAW 11/22/2020 16:38:04'!
wasPublishedAt: aPotentialPublicationTime

	^publicationTime = aPotentialPublicationTime ! !

!Publication class methodsFor: 'instance creation' stamp: 'HAW 11/22/2020 17:06:22'!
madeBy: aPublisher about: aMessage at: aPublicationTime 
	
	self assertHasNoInappropriateWord: aMessage.
	
	^self new initializeMadeBy: aPublisher about: aMessage at: aPublicationTime ! !

!Publication class methodsFor: 'assertions' stamp: 'HAW 11/22/2020 17:08:27'!
assertHasNoInappropriateWord: aMessage

	(self hasInappropriateWord: aMessage) ifTrue: [ ModelException signal: self inappropriateWord ]! !

!Publication class methodsFor: 'assertions' stamp: 'HAW 11/22/2020 16:59:51'!
inappropriateWord
	
	^'Post contains inappropriate language.'! !

!Publication class methodsFor: 'assertions' stamp: 'HAW 11/22/2020 17:07:04'!
inappropriatedWords

	^ { 'elephant'. 'orange'. 'ice cream' }! !

!Publication class methodsFor: 'testing' stamp: 'HAW 11/22/2020 17:08:42'!
hasInappropriateWord: aMessage

	| lowercaseMessage |
	
	lowercaseMessage := aMessage asLowercase.
	^self inappropriatedWords anySatisfy: [ :innappropriateWord | lowercaseMessage includesSubString: innappropriateWord ].! !

!Publisher methodsFor: 'assertions' stamp: 'HAW 11/22/2020 19:47:48'!
assertCanNotBeFollowedBySameFollowerTwice: aPotentialFollower

	(self isFollowedBy: aPotentialFollower) ifTrue: [ ModelException signal: self canNotBeFollowedBySameFollowerTwice ]! !

!Publisher methodsFor: 'assertions' stamp: 'HAW 11/22/2020 19:47:57'!
assertCanNotFollowSelf: aPotentialFollower
 
	self = aPotentialFollower ifTrue: [ ModelException signal: self canNotFollowSelf ]! !

!Publisher methodsFor: 'assertions' stamp: 'HAW 11/22/2020 19:45:43'!
canNotBeFollowedBySameFollowerTwice
	
	^'Can not follow publisher twice'! !

!Publisher methodsFor: 'assertions' stamp: 'HAW 11/22/2020 16:25:52'!
canNotFollowSelf
	
	^'Can not follow self'! !

!Publisher methodsFor: 'followers' stamp: 'HAW 11/22/2020 19:46:04'!
followedBy: aPotentialFollower 
	
	self assertCanNotFollowSelf: aPotentialFollower.
	self assertCanNotBeFollowedBySameFollowerTwice: aPotentialFollower.
	
	followers add: aPotentialFollower 
	! !

!Publisher methodsFor: 'followers' stamp: 'HAW 11/22/2020 19:39:31'!
followers
	self shouldBeImplemented.! !

!Publisher methodsFor: 'followers' stamp: 'HAW 11/22/2020 19:42:15'!
followersCollect: aCollectClosure

	^followers collect: aCollectClosure ! !

!Publisher methodsFor: 'followers' stamp: 'HAW 11/22/2020 19:42:27'!
hasFollowers
	
	^followers notEmpty ! !

!Publisher methodsFor: 'followers' stamp: 'HAW 11/22/2020 19:43:52'!
isFollowedBy: aPublisher 
	
	^followers includes: aPublisher ! !

!Publisher methodsFor: 'followers' stamp: 'HAW 11/22/2020 19:42:35'!
numberOfFollowers
	
	^followers size! !

!Publisher methodsFor: 'initialization' stamp: 'HAW 11/22/2020 19:42:15'!
initializeRelatedTo: aUser 
	
	user := aUser.
	followers := OrderedCollection new.
	publications := OrderedCollection new.! !

!Publisher methodsFor: 'publications' stamp: 'HAW 11/22/2020 16:30:31'!
hasPublications
	
	^publications notEmpty! !

!Publisher methodsFor: 'publications' stamp: 'HAW 11/22/2020 16:36:24'!
publish: aMessage at: aPublicationTime
 
	^publications add: (Publication madeBy: self about: aMessage at: aPublicationTime)! !

!Publisher methodsFor: 'publications' stamp: 'HAW 11/22/2020 16:52:54'!
timeline
	
	^self sortPublications: publications! !

!Publisher methodsFor: 'publications' stamp: 'HAW 11/22/2020 19:48:03'!
wall
	
	| wall |
	
	wall := OrderedCollection new.
	self addPublicationsTo: wall.
	
	followers do: [ :aFollower | aFollower addPublicationsTo: wall ].
	
	^self sortPublications: wall ! !

!Publisher methodsFor: 'publications - private' stamp: 'HAW 11/22/2020 16:49:14'!
addPublicationsTo: aWall

	aWall addAll: publications ! !

!Publisher methodsFor: 'publications - private' stamp: 'HAW 11/22/2020 20:05:01'!
sortPublications: aPublicationsCollection

	^ aPublicationsCollection sorted: [ :left :right | left wasPublishedAfter: right ]! !

!Publisher methodsFor: 'user' stamp: 'HAW 11/22/2020 19:41:33'!
relatedUser
	
	^user! !

!Publisher class methodsFor: 'instance creation' stamp: 'HAW 11/22/2020 16:13:09'!
relatedTo: aUser 
	
	^self new initializeRelatedTo: aUser ! !

!TestObjectsBucket methodsFor: 'time' stamp: 'HAW 11/22/2020 19:59:53'!
advanceTimeBy: aDelta

	^self clock advanceTimeBy: aDelta ! !

!TestObjectsBucket methodsFor: 'time' stamp: 'HAW 11/22/2020 19:57:15'!
clock
	
	^clock ifNil: [ clock := ManualClock atNow: GregorianDateTime now ]! !

!TestObjectsBucket methodsFor: 'time' stamp: 'HAW 11/22/2020 20:21:20'!
now
	
	^self clock now! !

!TestObjectsBucket methodsFor: 'juan perez' stamp: 'HAW 11/22/2020 16:19:18'!
createJuanPerez
	
	^User named: self juanPerezName about: self juanPerezAbout at: self juanPerezHomePage! !

!TestObjectsBucket methodsFor: 'juan perez' stamp: 'HAW 11/22/2020 16:19:46'!
juanPerezAbout
	
	^'Juan perez about'! !

!TestObjectsBucket methodsFor: 'juan perez' stamp: 'HAW 11/22/2020 16:20:04'!
juanPerezHomePage
	
	^'www.something.com'! !

!TestObjectsBucket methodsFor: 'juan perez' stamp: 'HAW 11/22/2020 16:19:33'!
juanPerezName
	
	^'Juan Perez'! !

!TestObjectsBucket methodsFor: 'juan perez' stamp: 'HAW 11/22/2020 17:35:16'!
juanPerezPassword
	
	^'juanPerezPassword'! !

!TestObjectsBucket methodsFor: 'pepe sanchez' stamp: 'HAW 11/22/2020 16:08:55'!
createPepeSanchez
	
	^User named: self pepeSanchezName about: self pepeSanchezAbout at: self pepeSanchezHomePage
! !

!TestObjectsBucket methodsFor: 'pepe sanchez' stamp: 'HAW 11/22/2020 16:09:19'!
pepeSanchezAbout
	
	^'Pepe Sanchez about'! !

!TestObjectsBucket methodsFor: 'pepe sanchez' stamp: 'HAW 11/22/2020 16:09:32'!
pepeSanchezHomePage
	
	^'www.10pines.com'! !

!TestObjectsBucket methodsFor: 'pepe sanchez' stamp: 'HAW 11/22/2020 16:09:07'!
pepeSanchezName
	
	^'Pepe Sanchez'! !

!TestObjectsBucket methodsFor: 'pepe sanchez' stamp: 'HAW 11/22/2020 17:27:54'!
pepeSanchezPassword
	
	^'pepeSanchezPassword'! !

!User methodsFor: 'initialization' stamp: 'HAW 11/22/2020 15:52:26'!
initializeNamed: aName about: anAbout at: aHomePage 
	
	name := aName.
	about := anAbout.
	homePage := aHomePage.! !

!User methodsFor: 'homePage' stamp: 'HAW 11/22/2020 17:32:30'!
homePage
	
	^homePage! !

!User methodsFor: 'name' stamp: 'HAW 11/22/2020 16:09:54'!
isNamed: aName

	^name = aName ! !

!User methodsFor: 'about' stamp: 'HAW 11/22/2020 17:32:24'!
about
	
	^about! !

!User class methodsFor: 'assertions' stamp: 'HAW 11/22/2020 20:36:41'!
assertNameIsNotEmpty: trimmedName

	^ trimmedName isEmpty ifTrue: [ ModelException signal: self nameCanNotBeBlank ]! !

!User class methodsFor: 'assertions' stamp: 'HAW 11/22/2020 15:51:44'!
nameCanNotBeBlank
	
	^'Name can not be blank'! !

!User class methodsFor: 'instance creation' stamp: 'HAW 11/22/2020 20:36:41'!
named: aName about: anAbout at: aHomePage 
	
	| trimmedName |
	
	trimmedName := aName withBlanksTrimmed.
	self assertNameIsNotEmpty: trimmedName.
	
	^self new initializeNamed: trimmedName about: anAbout at: aHomePage ! !

!UserCard methodsFor: 'initialization' stamp: 'HAW 11/22/2020 17:31:20'!
initializeOf: aUser authenticatedWith: aPassword relatedTo: aPublisher 
	
	user := aUser.
	password := aPassword.
	publisher := aPublisher.! !

!UserCard methodsFor: 'publisher' stamp: 'HAW 11/22/2020 19:25:42'!
publisher
	
	^publisher! !

!UserCard methodsFor: 'password' stamp: 'HAW 11/22/2020 19:20:04'!
hasPassword: aPotentialPassword

	^password = aPotentialPassword ! !

!UserCard methodsFor: 'user' stamp: 'HAW 11/22/2020 19:15:21'!
user
	
	^user! !

!UserCard class methodsFor: 'instance creation' stamp: 'HAW 11/22/2020 17:31:12'!
of: aUser authenticatedWith: aPassword relatedTo: aPublisher 
	
	^self new initializeOf: aUser authenticatedWith: aPassword relatedTo: aPublisher ! !
