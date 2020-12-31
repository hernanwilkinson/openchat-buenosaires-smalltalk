Lo que mostré en el webinar usa GemStone 3.1.0 y GemTools-1.0-beta.8.7-3101x
Las últimas versiones de GemStone no usan GemTools como cliente.
Por otro lado, no llegue a configurar bien el server de http de Swazoo para que use el
server del OpenChatSystem, por lo que hice esta pequeña chanchada para salir del paso:
En la clase HTTPServer, modifique el metodo #answerTo: de la siguiente manera:

answerTo: aRequest
	| response |

	"response := URIResolution resolveRequest: aRequest startingAt: self sites."
	aRequest port = 4321
		ifTrue: [ response := (Globals at: #OCServer) answerTo: aRequest. ]
		ifFalse: [ response := (Globals at: #OCServer2) answerTo: aRequest. ].

	^response isNil
		ifTrue: [HTTPResponse notFound]
		ifFalse: [response]


Para que funcione hay que indicar cual sería el server, para ello deben hacer:
OpenChatServer installOn4321   <-- para instalarlo en el port 4321
OpenChatServer installOn4322   <-- para instalarlo en el port 4322

Solo se puede instalar en el port 4322 si ya está instalado en el 4321 por cómo armé los scripts, pero eso se puede cambiar si es necesario
