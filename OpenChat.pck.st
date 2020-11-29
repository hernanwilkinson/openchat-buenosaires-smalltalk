'From Cuis 5.0 [latest update: #4384] on 29 November 2020 at 1:57:08 am'!
'Description Recepcionista y WebServer '!
!provides: 'OpenChat' 1 2!
!requires: 'Identities-UUID' 1 8 nil!
!requires: 'WebClient' 1 19 nil!
!requires: 'JSON' 1 19 nil!
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

!classDefinition: #RestReceptionistTest category: 'OpenChat'!
TestCase subclass: #RestReceptionistTest
	instanceVariableNames: 'receptionist testObjects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'RestReceptionistTest class' category: 'OpenChat'!
RestReceptionistTest class
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

!classDefinition: #LoadExampleWithReceptionist category: 'OpenChat'!
Object subclass: #LoadExampleWithReceptionist
	instanceVariableNames: 'userNamePrefix followers userName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'LoadExampleWithReceptionist class' category: 'OpenChat'!
LoadExampleWithReceptionist class
	instanceVariableNames: ''!

!classDefinition: #OpenChatServer category: 'OpenChat'!
Object subclass: #OpenChatServer
	instanceVariableNames: 'receptionist'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'OpenChatServer class' category: 'OpenChat'!
OpenChatServer class
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

!classDefinition: #ReceptionistResponse category: 'OpenChat'!
Object subclass: #ReceptionistResponse
	instanceVariableNames: 'status body'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'ReceptionistResponse class' category: 'OpenChat'!
ReceptionistResponse class
	instanceVariableNames: ''!

!classDefinition: #RestReceptionist category: 'OpenChat'!
Object subclass: #RestReceptionist
	instanceVariableNames: 'system idsByUser idsByPublication userNameById'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OpenChat'!
!classDefinition: 'RestReceptionist class' category: 'OpenChat'!
RestReceptionist class
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


!Publication methodsFor: 'as yet unclassified' stamp: 'HAW 11/29/2020 01:37:20'!
printOn: aStream

	aStream
		nextPutAll: message;
		nextPutAll: ' by '; 
		nextPutAll: self publisherRelatedUser name;
		nextPutAll: ' at '.
		
	publicationTime printWithoutOffsetOn: aStream ! !

!User methodsFor: 'name' stamp: 'HAW 11/25/2020 18:42:49'!
name

	^name! !

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

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/25/2020 18:49:57'!
test04_canNotRegisterSameUserTwice
	
	system := self createSystem.
	self registerPepeSanchez.
	
	self 
		should: [ self registerPepeSanchez ]
		raise: ModelException - MessageNotUnderstood 
		withExceptionDo: [ :aModelException |
			self assert: OpenChatSystem canNotRegisterSameUserTwice equals: aModelException messageText.
			
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

!OpenChatSystemTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 21:20:14'!
test12_canGetWallOfRegisteredUser
	
	| followedPublication followerPublication wall |
	
	system := self createSystem.
	self registerPepeSanchez.
	self registerJuanPerez.
	
	system userNamed: testObjects juanPerezName follows: testObjects pepeSanchezName.
	followedPublication := system publish: 'hello' forUserNamed: testObjects pepeSanchezName.
	testObjects advanceTimeBy: (Duration seconds: 1).
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

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/25/2020 20:13:07'!
test04_publisherCanNotFollowSamePublisherTwice

	| followed follower |
	
	followed := self createPepeSanchez.
	follower := self createJuanPerez.
	
	followed followedBy: follower.
	self 
		should: [ followed followedBy: follower ]
		raise: ModelException 
		withExceptionDo: [ :aModelException |
			self assert: Publisher canNotBeFollowedBySameFollowerTwice equals: aModelException messageText.
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

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/29/2020 01:51:00'!
test07_timelineHasPublisherPublicationsSortedWithLatestPublicationsFirst

	| createdPusblisher message firstPublication publicationTime secondPublication timeline |
	
	createdPusblisher := self createPepeSanchez.
	publicationTime := DateAndTime now.
	message := 'a message'.
	
	firstPublication := createdPusblisher publish: message at: publicationTime.
	secondPublication := createdPusblisher publish: message at: publicationTime + (Duration seconds: 1).
	
	timeline := createdPusblisher timeline.
	
	self assert: 2 equals: timeline size.
	self assert: secondPublication equals: timeline first.
	self assert: firstPublication equals: timeline second! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/29/2020 01:51:24'!
test08_wallContainsPublisherPublications

	| createdPusblisher message firstPublication publicationTime timeline |
	
	createdPusblisher := self createPepeSanchez.
	publicationTime := DateAndTime now.
	message := 'a message'.
	
	firstPublication := createdPusblisher publish: message at: publicationTime.
	
	timeline := createdPusblisher wall.
	
	self assert: 1 equals: timeline size.
	self assert: firstPublication equals: timeline first.
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/29/2020 01:51:35'!
test09_wallContainsFollowersPublications

	| followed message firstPublication publicationTime timeline follower |
	
	followed := self createPepeSanchez.
	follower := self createJuanPerez.
	followed followedBy: follower.
	
	publicationTime := DateAndTime now.
	message := 'a message'.
	
	firstPublication := follower publish: message at: publicationTime.
	
	timeline := followed wall.
	
	self assert: 1 equals: timeline size.
	self assert: firstPublication equals: timeline first.
	! !

!PublisherTest methodsFor: 'tests' stamp: 'HAW 11/29/2020 01:52:23'!
test10_wallContainsFollowersPublicationsWithLatestPublicationsFirst

	| followed message firstPublication publicationTime timeline follower secondPublication thirdPublication |
	
	followed := self createPepeSanchez.
	follower := self createJuanPerez.
	followed followedBy: follower.
	
	publicationTime := DateAndTime now.
	message := 'a message'.
	
	firstPublication := followed publish: message at: publicationTime.
	secondPublication := follower publish: message at: publicationTime + (Duration seconds: 1).
	thirdPublication := followed publish: message at: publicationTime + (Duration seconds: 2).
	
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

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/29/2020 00:35:10'!
test01_canRegisterUserWithValidData

	| response |
	
	receptionist := self createReceptionist.
	
	response := self registerJuanPerez.
	
	self assertJuanPerezIn: response withStatus: 201 ! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/25/2020 18:50:10'!
test02_canNotRegisterDuplicatedUser

	| response |
	
	receptionist := self createReceptionist.
	
	self registerJuanPerez.
	response := self registerJuanPerez.
	
	self assert: (response hasStatus: 400).
	self assert: OpenChatSystem canNotRegisterSameUserTwice equals: response body
	! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/25/2020 18:56:10'!
test03_canLoginRegisteredUserWithValidCredentials

	| response |
	
	receptionist := self createReceptionist.
	self registerJuanPerez.
	
	response := receptionist login: testObjects juanPerezLoginBodyAsJson.
	
	self assertJuanPerezIn: response withStatus: 200. ! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 19:17:44'!
test04_canNotLoginWithInvalidCredentials

	| response invalidLoginBody |
	
	receptionist := self createReceptionist.
	self registerJuanPerez.
	
	invalidLoginBody := testObjects juanPerezLoginBodyAsJson.
	invalidLoginBody at: #password put: testObjects juanPerezPassword, 'x'.
	
	response := receptionist login: invalidLoginBody.
	
	self assert: (response hasStatus: 400).
	self assert: RestReceptionist invalidCredentials equals: response body! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/25/2020 19:01:34'!
test05_usersReturnsAllRegisteredUsers

	| response |
	
	receptionist := self createReceptionist.
	self registerJuanPerez.
	
	response := receptionist users.
	
	self assertIsArrayWithJuanPerezOnly: response
	! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/25/2020 19:41:03'!
test06_registeredUserCanFollowAnotherRegisteredUser

	self makePepeSanchezFollowJuanPerezAndAssert: [ :response :followingsBody :followedResponse :followerResponse |
		self assert: (response hasStatus: 201).
		self assert: RestReceptionist followingsCreated equals: response body ]! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/25/2020 20:13:48'!
test07_canNotFollowAnAlreadyFollowedUser

        self makePepeSanchezFollowJuanPerezAndAssert: [ :response :followingsBodyAsJson :followedResponse :followerResponse | 
		| secondResponse |
		secondResponse := receptionist followings: followingsBodyAsJson.

                self assert: (secondResponse hasStatus: 400).
                self assert: Publisher canNotBeFollowedBySameFollowerTwice equals: secondResponse body ]! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/25/2020 20:16:05'!
test08_followersReturnsUserFollowers

        self makePepeSanchezFollowJuanPerezAndAssert: [ :response :followingsBodyAsJson :followedResponse :followerResponse | 
		| followersResponse | 
		
		followersResponse := receptionist followersOf: followedResponse idFromBody.
		
		self assertIsArrayWithJuanPerezOnly: followersResponse ]! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 21:14:33'!
test08__canNotGetFollowersOfNotRegisteredUser

        | followersResponse | 
		
	receptionist := self createReceptionist.
	followersResponse := receptionist followersOf: ''.
		
	self assert: (followersResponse hasStatus: 400).
	self assert: RestReceptionist invalidCredentials equals: followersResponse body! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 20:03:20'!
test09_registeredUserCanPublishAppropriateMessage

        | publicationMessage publicationResponse registeredUserResponse responseBody |

	receptionist := self createReceptionist.
	registeredUserResponse := self registerJuanPerez.

	publicationMessage := 'hello'.
	publicationResponse := self publish: publicationMessage of: registeredUserResponse.

	self assert: (publicationResponse hasStatus: 201).
	responseBody := publicationResponse body.
	self deny: (responseBody at: #postId) isEmpty.
	self assert: registeredUserResponse idFromBody equals: (responseBody at: #userId).
	self assert: publicationMessage equals: (responseBody at: #text).
	self assert: self formattedNow equals: (responseBody at: #dateTime).
	self assert: 0 equals: (responseBody at: #likes) asInteger! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 20:03:32'!
test10_canNotPublishInappropriateWords

	| publicationResponse registeredUserResponse |
	
	receptionist := self createReceptionist.
	registeredUserResponse := self registerJuanPerez.

	publicationResponse := self publish: 'elephant' of: registeredUserResponse.

	self assert: (publicationResponse hasStatus: 400).
	self assert: Publication inappropriateWord equals: publicationResponse body
! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 20:07:40'!
test11_invalidUserCanNotPublish

	| invalidUserId publicationResponse |
	
	receptionist := self createReceptionist.

	invalidUserId := ''.
	publicationResponse := receptionist addPublication: (testObjects publicationBodyAsJsonFor: 'something') of: invalidUserId.

	self assert: (publicationResponse hasStatus:400).
	self assert: RestReceptionist invalidCredentials equals: publicationResponse body! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 20:13:41'!
test12_timelineReturnsUserPublications

	| publicationResponse registeredUserResponse timelineResponse body publicationAsJson |
	
	receptionist := self createReceptionist.
	registeredUserResponse := self registerJuanPerez.
	publicationResponse := self publish: 'hello' of: registeredUserResponse.

	timelineResponse := receptionist timelineOf: registeredUserResponse idFromBody.

	self assert: (timelineResponse hasStatus: 200).
	body := timelineResponse body.
	self assert: 1 equals: body size.
	
	publicationAsJson := publicationResponse body.
	self assert: publicationAsJson equals: body first

	! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 21:08:55'!
test12__canNotAskTimelineOfNotRegisteredUser

	| timelineResponse |
	
	receptionist := self createReceptionist.
	
	timelineResponse := receptionist timelineOf: ''.

	self assert: (timelineResponse hasStatus: 400).
	self assert: RestReceptionist invalidCredentials equals: timelineResponse body.
	
	! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 20:33:22'!
test13_wallReturnsFollowedAndFollowersPublications

        | followedPublicationAsJson followedPublicationResponse followerPublicationAsJson followerPublicationResponse wallResponse |

	self makePepeSanchezFollowJuanPerezAndAssert: [ :response :followingsBodyAsJson :followedResponse :followerResponse | 
		followedPublicationResponse := self publish: 'hello' of: followedResponse.
		followerPublicationResponse := self publish: 'bye' of: followerResponse.
		
		wallResponse := receptionist wallOf: followedResponse idFromBody.
		self assert: (wallResponse hasStatus: 200).
		self assert: 2 equals: wallResponse body size.
		
		followedPublicationAsJson := followedPublicationResponse body.
		self assert: followedPublicationAsJson equals: wallResponse body first.
		
		followerPublicationAsJson := followerPublicationResponse body.
		self assert: followerPublicationAsJson equals: wallResponse body second.]! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 21:09:27'!
test13__canNotAskWallOfNotRegisteredUser

	| timelineResponse |
	
	receptionist := self createReceptionist.
	
	timelineResponse := receptionist wallOf: ''.

	self assert: (timelineResponse hasStatus: 400).
	self assert: RestReceptionist invalidCredentials equals: timelineResponse body.
	
	! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 20:44:42'!
test14_userCanLikePublication

	| likeResponse likerUserResponse publicationResponse publisherUserResponse |
	
	receptionist := self createReceptionist.
	publisherUserResponse := self registerJuanPerez.
	likerUserResponse := self registerPepeSanchez.

	publicationResponse := self publish: 'Hello' of: publisherUserResponse.
	likeResponse := receptionist 
		publicationIdentifiedAs: (self publicationIdFrom: publicationResponse)
		likedBy: (self likerAsJsonOf: likerUserResponse).

	self assert: (likeResponse hasStatus: 200).
	self assert: 1 equals: (likeResponse body at: #likes)! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 20:54:17'!
test15_notRegisteredUserCanNotLikePublication

	| likeResponse publicationResponse publisherUserResponse invalidLikerAsJson |
	
	receptionist := self createReceptionist.
	publisherUserResponse := self registerJuanPerez.
	
	publicationResponse := self publish: 'Hello' of: publisherUserResponse.
	invalidLikerAsJson := Dictionary new
		at: #userId put: '';
		yourself.
	likeResponse := receptionist 
		publicationIdentifiedAs: (self publicationIdFrom: publicationResponse)
		likedBy: (invalidLikerAsJson).

	self assert: (likeResponse hasStatus: 400).
	self assert: RestReceptionist invalidCredentials equals: likeResponse body.! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 20:58:07'!
test16_canNotLikeNotPublishedPublication

	| likeResponse publisherUserResponse |
	
	receptionist := self createReceptionist.
	publisherUserResponse := self registerJuanPerez.
	
	likeResponse := receptionist 
		publicationIdentifiedAs: ''
		likedBy: (self likerAsJsonOf: publisherUserResponse).

	self assert: (likeResponse hasStatus: 400).
	self assert: RestReceptionist invalidPublication equals: likeResponse body.! !

!RestReceptionistTest methodsFor: 'tests' stamp: 'HAW 11/28/2020 21:01:50'!
test17_timelineIncludesLikes

	| publicationResponse registeredUserResponse timelineResponse body likerUserResponse |
	
	receptionist := self createReceptionist.
	registeredUserResponse := self registerJuanPerez.
	likerUserResponse := self registerPepeSanchez.

	publicationResponse := self publish: 'hello' of: registeredUserResponse.
	receptionist 
		publicationIdentifiedAs: (self publicationIdFrom: publicationResponse)
		likedBy: (self likerAsJsonOf: likerUserResponse).
	
	timelineResponse := receptionist timelineOf: registeredUserResponse idFromBody.

	self assert: (timelineResponse hasStatus: 200).
	body := timelineResponse body.
	self assert: 1 equals: body size.
	self assert: 1 equals: (body first at: #likes)

	! !

!RestReceptionistTest methodsFor: 'assertions' stamp: 'HAW 11/25/2020 19:13:11'!
assertIsArrayWithJuanPerezOnly: aResponse 
	
	self assert: (aResponse hasStatus: 200).
	self assert: 1 equals: aResponse body size.
	self assertJuanPerezJsonIs: aResponse body first! !

!RestReceptionistTest methodsFor: 'assertions' stamp: 'HAW 11/25/2020 19:12:04'!
assertJuanPerezIn: aResponse withStatus: aStatus

	self assert: (aResponse hasStatus: aStatus).
	self assertJuanPerezJsonIs: aResponse body
       ! !

!RestReceptionistTest methodsFor: 'assertions' stamp: 'HAW 11/28/2020 19:17:01'!
assertJuanPerezJsonIs: aBodyAsJson

	self deny: (aBodyAsJson at: #id) isEmpty.
	self assert: testObjects juanPerezName 	equals: (aBodyAsJson at: #username).
	self assert: testObjects juanPerezAbout 	equals: (aBodyAsJson at: #about).
	self assert: testObjects juanPerezHomePage 	equals: (aBodyAsJson at: #homePage).
	self deny: (aBodyAsJson includesKey: #password)! !

!RestReceptionistTest methodsFor: 'test objects' stamp: 'HAW 11/25/2020 11:02:46'!
createReceptionist
	
	^RestReceptionist for: (OpenChatSystem timingWith: testObjects clock)! !

!RestReceptionistTest methodsFor: 'test objects' stamp: 'HAW 11/25/2020 20:58:23'!
formattedNow
	
	"Esto no esta bien porque esta usando lo mismo que está testeando, pero lo hago así por una cuestion de tiempo - Hernan"
	^receptionist formatDateTime: testObjects now
! !

!RestReceptionistTest methodsFor: 'test objects' stamp: 'HAW 11/28/2020 20:46:06'!
likerAsJsonOf: aReceptionistResponse 
	
	^Dictionary new
		at: #userId put: aReceptionistResponse idFromBody;
		yourself! !

!RestReceptionistTest methodsFor: 'test objects' stamp: 'HAW 11/28/2020 20:45:10'!
publicationIdFrom: aReceptionistResponse 
	
	^aReceptionistResponse body at: #postId! !

!RestReceptionistTest methodsFor: 'test objects' stamp: 'HAW 11/25/2020 20:27:58'!
publish: aMessage of: aUserRegistrationResponse

	| publisherId |

	publisherId := aUserRegistrationResponse idFromBody.
	
	^receptionist addPublication: (testObjects publicationBodyAsJsonFor: aMessage) of: publisherId
                
                ! !

!RestReceptionistTest methodsFor: 'registration' stamp: 'HAW 11/28/2020 19:14:21'!
makePepeSanchezFollowJuanPerezAndAssert: assertionsBlock

	| followedResponse followerResponse followingsBodyAsJson response |
	receptionist := self createReceptionist.
	followedResponse := self registerPepeSanchez.
	followerResponse := self registerJuanPerez.

        followingsBodyAsJson := Dictionary new
		at: #followerId put: followedResponse idFromBody;
		at: #followeeId put: followerResponse idFromBody;
		yourself.
		
	response := receptionist followings: followingsBodyAsJson.
	assertionsBlock value: response value: followingsBodyAsJson value: followedResponse value: followerResponse! !

!RestReceptionistTest methodsFor: 'registration' stamp: 'HAW 11/25/2020 11:04:10'!
registerJuanPerez
	
	^receptionist registerUser: testObjects juanPerezRegistrationBodyAsJson! !

!RestReceptionistTest methodsFor: 'registration' stamp: 'HAW 11/25/2020 19:48:12'!
registerPepeSanchez
	
	^receptionist registerUser: testObjects pepeSanchezRegistrationBodyAsJson! !

!RestReceptionistTest methodsFor: 'setUp' stamp: 'HAW 11/25/2020 11:03:12'!
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

!LoadExampleWithReceptionist methodsFor: 'load' stamp: 'HAW 11/28/2020 21:51:01'!
loadOn: aSystem with: aNumberOfUsers followers: aNumberOfFollowers publications: aNumberOfPublications

"
	Inspeccionar la siguiente linea:
	self new loadOn: (OpenChatSystem timingWith: DateAndTime) with: 1000 followers: 20 publications: 300
"

	| startStats endStats elapseTime receptionist |
	
	Smalltalk garbageCollect.
	startStats := Utilities vmStatisticsReportString.
	
	userNamePrefix := 'AAAAA'.
	followers := OrderedCollection new.
	receptionist := RestReceptionist for: aSystem.
	
	elapseTime := Time millisecondsToRun: [
		1 to: aNumberOfUsers do: [ :currentUserIndex | | userId |
			self createUserNameWith: currentUserIndex.
			userId := self registerUserIn: receptionist.
			self addFollowers: aNumberOfFollowers to: userId in: receptionist.
			self addPublications: aNumberOfPublications of: userId in: receptionist.
			self calculateUserNamePrefix: currentUserIndex ]].
	
	Smalltalk garbageCollect.	
	endStats := Utilities vmStatisticsReportString.
	
	^Array with: elapseTime with: startStats with: endStats ! !

!LoadExampleWithReceptionist methodsFor: 'load - private' stamp: 'HAW 11/28/2020 21:45:55'!
addFollowers: aNumberOfFollowers to: aUserId in: aReceptionist 
	
	followers do: [:aFollower | aReceptionist followings: (Dictionary new
		at: #followerId put: aUserId;
		at: #followeeId put: aFollower;
		yourself) ].
	
	followers add: aUserId.
	followers size > aNumberOfFollowers ifTrue: [ followers removeFirst ].! !

!LoadExampleWithReceptionist methodsFor: 'load - private' stamp: 'HAW 11/28/2020 21:48:57'!
addPublications: aNumberOfPublications of: aUserId in: aReceptionist
	
	| publicationMessage |
	
	publicationMessage := String streamContents: [ :stream |
		userName size timesRepeat: [ stream nextPutAll: userName ]].
	
	aNumberOfPublications timesRepeat: [ 
		aReceptionist 
			addPublication: (Dictionary new
				at: #text put: publicationMessage copy;
				yourself)
		 	of: aUserId ]! !

!LoadExampleWithReceptionist methodsFor: 'load - private' stamp: 'HAW 11/28/2020 21:39:08'!
calculateUserNamePrefix: currentUserIndex
	
	currentUserIndex \\ 26 = 0 ifTrue: [ userNamePrefix := userNamePrefix , 'A' ].! !

!LoadExampleWithReceptionist methodsFor: 'load - private' stamp: 'HAW 11/28/2020 21:39:08'!
createUserNameWith: currentUserIndex
	
	userName := userNamePrefix,(Character asciiValue: `$A asciiValue` + currentUserIndex \\ 26) asString
	
	! !

!LoadExampleWithReceptionist methodsFor: 'load - private' stamp: 'HAW 11/28/2020 21:50:04'!
registerUserIn: aReceptionist
	
	^(aReceptionist registerUser: (
		Dictionary new
			at: #username put: userName;
			at: #password put: userName;
			at: #about put: userName,userName,userName;
			at: #homePage put: 'www.10pines.com';
			yourself)) idFromBody ! !

!OpenChatServer methodsFor: 'initialization' stamp: 'HAW 11/29/2020 00:39:31'!
initializeOn: aReceptionist 
	
	receptionist := aReceptionist.! !

!OpenChatServer methodsFor: 'rest interface' stamp: 'HAW 11/29/2020 01:25:25'!
followings: aRequest

	| response |
	
	response := aRequest isPostRequest 
		ifTrue: [ receptionist followings: (Json readFrom: aRequest stream) ]
		ifFalse: [ receptionist followersOf: (aRequest url asPathTokens) second ].
		
	aRequest sendResponseCode: response status content: response bodyAsString type: 'application/json' do: [ :r | ] 
! !

!OpenChatServer methodsFor: 'rest interface' stamp: 'HAW 11/29/2020 01:25:30'!
login: aRequest

	| response |
	
	response := receptionist login: (Json readFrom: aRequest stream).
		
	aRequest sendResponseCode: response status content: response bodyAsString type: 'application/json' do: [ :r | ] 
! !

!OpenChatServer methodsFor: 'rest interface' stamp: 'HAW 11/29/2020 01:25:35'!
publications: aRequest

	| response |
	
	response :=receptionist publicationIdentifiedAs: (aRequest url asPathTokens) second likedBy: (Json readFrom: aRequest stream).
		
	aRequest sendResponseCode: response status content: response bodyAsString type: 'application/json' do: [ :r | ] 
! !

!OpenChatServer methodsFor: 'rest interface' stamp: 'HAW 11/29/2020 01:28:45'!
reset: aRequest

	receptionist := self class defaultReceptionist.
	
	aRequest send200Response: 'reseted'! !

!OpenChatServer methodsFor: 'rest interface' stamp: 'HAW 11/29/2020 01:52:58'!
users: aRequest

	| response |

	response := aRequest isPostRequest 
		ifTrue: [ 
			(aRequest url endsWith: 'timeline')
				ifTrue: [ receptionist addPublication: (Json readFrom: aRequest stream) of: (aRequest url asPathTokens) second ]
				ifFalse: [ receptionist registerUser: (Json readFrom: aRequest stream) ]]
		ifFalse: [ 
			(aRequest url endsWith: 'timeline')
				ifTrue: [  receptionist timelineOf: (aRequest url asPathTokens) second ]
				ifFalse: [ (aRequest url endsWith: 'wall')
					ifTrue: [  receptionist wallOf: (aRequest url asPathTokens) second ]
					ifFalse: [ receptionist users ]]].
		
	aRequest sendResponseCode: response status content: response bodyAsString type: 'application/json' do: [ :r | ] 
! !

!OpenChatServer class methodsFor: 'instance creation' stamp: 'HAW 11/29/2020 01:25:11'!
on: aReceptionist 

	^self new initializeOn: aReceptionist ! !

!OpenChatServer class methodsFor: 'installation' stamp: 'HAW 11/29/2020 01:53:15'!
defaultReceptionist

	^ RestReceptionist for: (OpenChatSystem timingWith: DateAndTime)! !

!OpenChatServer class methodsFor: 'installation' stamp: 'HAW 11/29/2020 01:28:07'!
installForDefaultSystem

	"self installForDefaultSystem"
	
	| server port interface |
	
	interface := self on: self defaultReceptionist.
	
	"Esto es para poder acceder a la interface de manera global - Hernan"
	Smalltalk at: #OpenChatRestReceptionist put: interface.
	
	port := 4321.
	server := WebServer reset default.
	server listenOn: port.
	server 
		addService: '/reset' 
		action: [:request | interface reset: request ].
	server 
		addService: '/users' 
		action: [:request | interface users: request ].
	server 
		addService: '/login' 
		action: [:request | interface login: request ].
	server
		addService: '/followings' 
		action: [:request | interface followings: request ].
	server
		addService: '/publications' 
		action: [:request | interface publications: request ].
	
	server useDebugErrorHandler ! !

!OpenChatSystem methodsFor: 'assertions' stamp: 'HAW 11/25/2020 18:49:51'!
assertIsNotDuplicated: aUserName

	(self hasUserNamed: aUserName) ifTrue: [ ModelException signal: self class canNotRegisterSameUserTwice ]! !

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

!OpenChatSystem methodsFor: 'users' stamp: 'HAW 11/25/2020 19:04:10'!
users
	
	^userCards values collect: [ :aUserCard | aUserCard user ]! !

!OpenChatSystem methodsFor: 'users - private' stamp: 'HAW 11/22/2020 20:29:21'!
publisherForUserNamed: aUserName

	^userCards 
		at: aUserName 
		ifPresent: [ :userCard | userCard publisher ]
		ifAbsent: [ ModelException signal: self userNotRegistered ]! !

!OpenChatSystem class methodsFor: 'instance creation' stamp: 'HAW 11/22/2020 19:58:09'!
timingWith: aClock 
	
	^self new initializeTimingWith: aClock ! !

!OpenChatSystem class methodsFor: 'assertions' stamp: 'HAW 11/25/2020 18:49:41'!
canNotRegisterSameUserTwice
	
	^'Username already in use.'! !

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

!Publication methodsFor: 'testing' stamp: 'HAW 11/29/2020 01:40:28'!
wasPublishedAfter: aPublication 
	
	^publicationTime >= aPublication publicationTime! !

!Publication methodsFor: 'testing' stamp: 'HAW 11/22/2020 16:38:04'!
wasPublishedAt: aPotentialPublicationTime

	^publicationTime = aPotentialPublicationTime ! !

!Publication methodsFor: 'message' stamp: 'HAW 11/25/2020 20:43:07'!
message
	
	^message! !

!Publication methodsFor: 'publisher' stamp: 'HAW 11/28/2020 20:39:04'!
publisherRelatedUser
	
	^publisher relatedUser ! !

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

!Publisher methodsFor: 'assertions' stamp: 'HAW 11/25/2020 20:12:49'!
assertCanNotBeFollowedBySameFollowerTwice: aPotentialFollower

	(self isFollowedBy: aPotentialFollower) ifTrue: [ ModelException signal: self class canNotBeFollowedBySameFollowerTwice ]! !

!Publisher methodsFor: 'assertions' stamp: 'HAW 11/22/2020 19:47:57'!
assertCanNotFollowSelf: aPotentialFollower
 
	self = aPotentialFollower ifTrue: [ ModelException signal: self canNotFollowSelf ]! !

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

!Publisher class methodsFor: 'assertions' stamp: 'HAW 11/25/2020 20:12:37'!
canNotBeFollowedBySameFollowerTwice
	
	^'Can not follow publisher twice'! !

!ReceptionistResponse methodsFor: 'initialization' stamp: 'HAW 11/25/2020 18:48:09'!
initializeStatus: aStatus body: aBody 
	
	status := aStatus.
	body := aBody.! !

!ReceptionistResponse methodsFor: 'body' stamp: 'HAW 11/25/2020 18:48:22'!
body
	
	^body! !

!ReceptionistResponse methodsFor: 'body' stamp: 'HAW 11/29/2020 00:31:57'!
bodyAsString

	^body isString 
		ifTrue: [ body ]
		ifFalse: [ body asJsonString ]! !

!ReceptionistResponse methodsFor: 'body' stamp: 'HAW 11/28/2020 19:18:06'!
idFromBody
	
	^body at: #id! !

!ReceptionistResponse methodsFor: 'status' stamp: 'HAW 11/25/2020 18:35:26'!
hasStatus: aStatus

	^status = aStatus ! !

!ReceptionistResponse methodsFor: 'status' stamp: 'HAW 11/29/2020 00:30:06'!
status
	
	^status! !

!ReceptionistResponse class methodsFor: 'instance creation' stamp: 'HAW 11/25/2020 18:48:31'!
status: aStatus body: aBody 
	
	^self new initializeStatus: aStatus body: aBody ! !

!RestReceptionist methodsFor: 'followers' stamp: 'HAW 11/28/2020 21:14:48'!
followersOf: aUserId

	^self handleModelExceptionWhile: [
		self okResponseWithUserArrayFrom: (system followersOfUserNamed: (self userNameFrom: aUserId))]! !

!RestReceptionist methodsFor: 'followers' stamp: 'HAW 11/28/2020 21:17:10'!
followings: aFollowingsBodyAsJson

	^self handleModelExceptionWhile: [ 
		| followedId followerId |	
		
		followedId := aFollowingsBodyAsJson at: #followerId.
		followerId := aFollowingsBodyAsJson at: #followeeId.

		system userNamed: (self userNameFrom: followerId) follows: (self userNameFrom: followedId).
		ReceptionistResponse status: 201 body: self class followingsCreated ]! !

!RestReceptionist methodsFor: 'initialization' stamp: 'HAW 11/28/2020 21:56:27'!
initializeFor: anOpenChatSystem 
	
	system := anOpenChatSystem.
	idsByUser := Dictionary new.
	userNameById := Dictionary new.
	idsByPublication := Dictionary new.! !

!RestReceptionist methodsFor: 'publications' stamp: 'HAW 11/28/2020 21:17:04'!
addPublication: aMessageAsJson of: aUserId

	^self handleModelExceptionWhile: [ 
		| publication publicationId |
		
		publication := system publish: (aMessageAsJson at: #text) forUserNamed: (self userNameFrom: aUserId).
		publicationId := self generateId.
		idsByPublication at: publication put: publicationId.

	        ReceptionistResponse status: 201 body: (self publicationAsJson: publication ) ]
		! !

!RestReceptionist methodsFor: 'publications' stamp: 'HAW 11/28/2020 21:17:21'!
publicationIdentifiedAs: aPostId likedBy: aLikerAsJson

	^self handleModelExceptionWhile: [ 
		| publication userName body likes |
		
		publication := self publicationIdentifiedAs: aPostId.
		userName := self userNameFrom: (aLikerAsJson at: #userId).
		
		likes := system liked: publication by: userName.
		body := Dictionary new
			at: #likes put: likes;
			yourself.
			
		ReceptionistResponse status: 200 body: body]
		! !

!RestReceptionist methodsFor: 'publications' stamp: 'HAW 11/28/2020 21:55:43'!
timelineOf: aUserId 
	
	^self handleModelExceptionWhile: [
		| timeline timelineAsJson |	
		
		timeline := system timelineOfUserNamed: (self userNameFrom: aUserId).
		timelineAsJson := self publicationsAsJsonOf: timeline for: aUserId.
		
		ReceptionistResponse status: 200 body: timelineAsJson ]
! !

!RestReceptionist methodsFor: 'publications' stamp: 'HAW 11/28/2020 21:55:51'!
wallOf: aUserId

	^self handleModelExceptionWhile: [
		| wall |
		
		wall := system wallOfUserNamed: (self userNameFrom: aUserId).
		
		ReceptionistResponse status: 200 body: (self publicationsAsJsonOf: wall for: aUserId) ]
		! !

!RestReceptionist methodsFor: 'publications - private' stamp: 'HAW 11/29/2020 01:49:44'!
formatDateTime: aDateTime 
	
"yyyy-MM-ddTHH:mm:ssZ'"

	| dateTimeString |

	dateTimeString := String streamContents: [ :stream | aDateTime printWithoutOffsetOn: stream ].
	dateTimeString at: 20 put: $Z.
	
	^dateTimeString first: 20
	
		
		! !

!RestReceptionist methodsFor: 'publications - private' stamp: 'HAW 11/29/2020 01:19:58'!
publicationAsJson: aPublication  

	^OrderedDictionary new
		at: #postId put: (idsByPublication at: aPublication);
		at: #userId put: (self userIdFor: aPublication publisherRelatedUser);
		at: #text put: aPublication message;
		at: #dateTime put: (self formatDateTime: aPublication publicationTime);
		at: #likes put: (system likesOf: aPublication);
		yourself ! !

!RestReceptionist methodsFor: 'publications - private' stamp: 'HAW 11/28/2020 20:59:07'!
publicationIdentifiedAs: aPublicationId

	idsByPublication keysAndValuesDo: [ :publication :id | aPublicationId = id ifTrue: [ ^publication ]].
	
	ModelException signal: self class invalidPublication ! !

!RestReceptionist methodsFor: 'publications - private' stamp: 'HAW 11/28/2020 20:39:52'!
publicationsAsJsonOf: timeline for: aUserId

	^ timeline collect: [ :aPublication | self publicationAsJson: aPublication ]! !

!RestReceptionist methodsFor: 'users' stamp: 'HAW 11/28/2020 19:17:25'!
login: aLoginBodyAsJson

	^system 
		authenticate: (aLoginBodyAsJson at: #username)
		with: (aLoginBodyAsJson at: #password)
		andDo: [ :authenticatedUser | 
			ReceptionistResponse 
				status: 200 
				body: (self userResponseAsJsonFor: authenticatedUser identifiedAs: (self userIdFor: authenticatedUser)) ]
		ifFail: [ ReceptionistResponse 
				status: 400
				body: self class invalidCredentials ]! !

!RestReceptionist methodsFor: 'users' stamp: 'HAW 11/29/2020 00:35:04'!
registerUser: aRegistrationBodyAsJson

	^self handleModelExceptionWhile: [ 
		| registeredUserId user |
		
		user := system 
			registerUserNamed: (aRegistrationBodyAsJson at: #username)
			authenticatedWith: (aRegistrationBodyAsJson at: #password)
			with: (aRegistrationBodyAsJson at: #about)
			at: (aRegistrationBodyAsJson at: #homePage).
			
		registeredUserId := self generateId.
		idsByUser at: user put: registeredUserId.
		userNameById at: registeredUserId put: user name.
		
		ReceptionistResponse status: 201 body: (self userResponseAsJsonFor: user identifiedAs: registeredUserId) ]
		! !

!RestReceptionist methodsFor: 'users' stamp: 'HAW 11/25/2020 19:03:10'!
users
	
	^self okResponseWithUserArrayFrom: system users ! !

!RestReceptionist methodsFor: 'users - private' stamp: 'HAW 11/25/2020 19:09:27'!
okResponseWithUserArrayFrom: aCollectionOfUsers

	^ReceptionistResponse 
		status: 200
		body: (aCollectionOfUsers collect: [ :aUser | self userResponseAsJsonFor: aUser identifiedAs: (self userIdFor: aUser) ]).! !

!RestReceptionist methodsFor: 'users - private' stamp: 'HAW 11/25/2020 18:56:30'!
userIdFor: aUser 
	
	^idsByUser at: aUser ! !

!RestReceptionist methodsFor: 'users - private' stamp: 'HAW 11/28/2020 21:57:20'!
userNameFrom: anId

	^userNameById 
		at: anId 
		ifAbsent: [ ModelException signal: self class invalidCredentials ]! !

!RestReceptionist methodsFor: 'users - private' stamp: 'HAW 11/29/2020 01:18:59'!
userResponseAsJsonFor: aRegisteredUser identifiedAs: anId 
	
	^OrderedDictionary new
		at: #id put: anId;
		at: #username put: aRegisteredUser name;
		at: #about put: aRegisteredUser about;
		at: #homePage put: aRegisteredUser homePage; 
		yourself ! !

!RestReceptionist methodsFor: 'private' stamp: 'HAW 11/25/2020 16:47:33'!
generateId
	
	^UUID new asString! !

!RestReceptionist methodsFor: 'private' stamp: 'HAW 11/28/2020 21:11:58'!
handleModelExceptionWhile: aBlock

	^aBlock
		on: ModelException 
		do: [ :error | error return: (ReceptionistResponse status: 400 body: error messageText) ]! !

!RestReceptionist class methodsFor: 'instance creation' stamp: 'HAW 11/25/2020 11:03:24'!
for: anOpenChatSystem 
	
	^self new initializeFor: anOpenChatSystem ! !

!RestReceptionist class methodsFor: 'as yet unclassified' stamp: 'HAW 11/25/2020 20:08:59'!
followingsCreated
	
	^'Following created.'! !

!RestReceptionist class methodsFor: 'as yet unclassified' stamp: 'HAW 11/25/2020 18:59:15'!
invalidCredentials
	
	^'Invalid credentials.'! !

!RestReceptionist class methodsFor: 'as yet unclassified' stamp: 'HAW 11/28/2020 20:58:20'!
invalidPublication
	
	^'Invalid publication'! !

!TestObjectsBucket methodsFor: 'time' stamp: 'HAW 11/22/2020 19:59:53'!
advanceTimeBy: aDelta

	^self clock advanceTimeBy: aDelta ! !

!TestObjectsBucket methodsFor: 'time' stamp: 'HAW 11/29/2020 01:49:13'!
clock
	
	^clock ifNil: [ clock := ManualClock atNow: DateAndTime now ]! !

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

!TestObjectsBucket methodsFor: 'juan perez' stamp: 'HAW 11/28/2020 19:14:37'!
juanPerezLoginBodyAsJson
	
	^Dictionary new 
		at: #username put: self juanPerezName;
		at: #password put: self juanPerezPassword;
		yourself! !

!TestObjectsBucket methodsFor: 'juan perez' stamp: 'HAW 11/22/2020 16:19:33'!
juanPerezName
	
	^'Juan Perez'! !

!TestObjectsBucket methodsFor: 'juan perez' stamp: 'HAW 11/22/2020 17:35:16'!
juanPerezPassword
	
	^'juanPerezPassword'! !

!TestObjectsBucket methodsFor: 'juan perez' stamp: 'HAW 11/28/2020 19:15:24'!
juanPerezRegistrationBodyAsJson
	
	^self juanPerezLoginBodyAsJson
		at: #about put: self juanPerezAbout;
		at: #homePage put: self juanPerezHomePage;
		yourself! !

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

!TestObjectsBucket methodsFor: 'pepe sanchez' stamp: 'HAW 11/28/2020 19:14:53'!
pepeSanchezLoginBodyAsJson
	
	^Dictionary new 
		at: #username put: self pepeSanchezName;
		at: #password put: self pepeSanchezPassword;
		yourself! !

!TestObjectsBucket methodsFor: 'pepe sanchez' stamp: 'HAW 11/22/2020 16:09:07'!
pepeSanchezName
	
	^'Pepe Sanchez'! !

!TestObjectsBucket methodsFor: 'pepe sanchez' stamp: 'HAW 11/22/2020 17:27:54'!
pepeSanchezPassword
	
	^'pepeSanchezPassword'! !

!TestObjectsBucket methodsFor: 'pepe sanchez' stamp: 'HAW 11/28/2020 19:17:59'!
pepeSanchezRegistrationBodyAsJson
	
	^self pepeSanchezLoginBodyAsJson
		at: #about put: self pepeSanchezAbout;
		at: #homePage put: self pepeSanchezHomePage;
		yourself! !

!TestObjectsBucket methodsFor: 'publications' stamp: 'HAW 11/28/2020 19:15:02'!
publicationBodyAsJsonFor: aMessage

	^Dictionary new
		at: #text put: aMessage;
		yourself ! !

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
