# t3-build-demo
Diese Demo ist dafür gemacht um die Hauptmerkmale von t3-build zu zeigen.

Ein Hauptziel dieses Projektes ist es, die Entwicklung eines HTML-Frontends und dessen Implementierung in TYPO3 zu optimieren.

## t3-build lokal starten

In vielen Projekten besteht auf die Anforderung, dass das HTML, CSS und Javscript komplett ohne CMS entwickelt wird.

Hierzu bietet t3-build die Möglichkeit eine gemeinsamen Entwicklung.

Wir brauchen ein lokales node 16 und mkcert um ein lokales Zertifikat zu erstellen.

Auf nicht-linux-Systemen muss hier jetzt wahrscheinlich node_modules gelöscht werden.



## Das Demo starten

Um das Demo zu starten, folgen wir der Anleitung auf github

Danach öffnen wir die Demoseiten.
Da der Browsersync in ddev gestartet wird, ist die angezeigte URL leider falsch.
Wenn der Anleitung von github folgts, findest Du die richtig URL.

Wie gesagt, das Ziel war, den Frontend-Entwicklern einen Umgebung zu bieten in der sie ein Frontend entwickeln können und dabei mit Integration zusammen zu arbeiten.

Dazu habe ich einen Watcher und Kompiler geschrieben der die Quell-Dateien beobachtet und auf Änderungen reagiert um diese in das site-package zu schreiben.

Wir sehen hier das Frontend eine TYPO3 Version 12 und die Quelldateien im Frontendordner.

Um die Frontendentwicklung zu erleichtern gibt es die beiden TAGs \<include> und \<module>.
Damit steht dem Frontendentwickler eine kleine Template-Engine zur Verfügung.

Natürlich können wir auch das CSS oder Javascript bearbeiten und jede Änderung wird sofort übersetzt und durch das TYPO3 hindurch gereicht.

Als TYPO3 Integrator ist man viel im Backend unterwegs. Um diese Änderungen auch direkt im Frontend zu sehen, habe eine kleine Extension geschrieben, die den Browsersync triggern kann.

Die wahren Stärken von t3-build kommen jedoch zum tragen, wenn man das HTML und CSS der Komponenten in eine Datei kapseln möchte.

Hierzu ist es möglich, dass CSS direkt in dem Template der Komponente zu platzieren. Der Kompiler nimmt den Code heraus und ersetzt ihn durch eine \<f:assets.css> Zeile.

In der TYPO3 Konfiguration kann jetzt entschieden werden, ob nur benötigtes CSS in einzelnen Dateien ausgeliefert wird oder ob alle CSS-Dateien zu einer großen zusammen gefügt werden.

Sobald in dem Projekt HTTP/2 zur Verfügung steht, sollte auf jeden Fall nur benötigtes CSS angeliefert werden.


...





Als erstes möchte ich euch zeigen, wie schnell die Änderungen vom HTML Template ins Frontend durchgereicht werden


