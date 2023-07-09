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



Hallo, mein Name ist Michael Stein.
Ich möchte euch eine Frontendentwicklung geben.
System vorstellen.
das T3-Bild heißt.
In diesem Paket...
das darum, dass man Frontententwickler und Backendentwickler und Integratoren zusammenführen kann.
in ein Entwicklungs-Summen.
in einer Entwicklungsumgebung.
arbeiten lassen kann.
In der Vergangenheit habe ich immer wieder
festgestellt, dass es Probleme gibt.
gibt, backend Entwickler und
Frontenentwickler zusammen zu paukaufen.
dann hat der Frontendentwickler
gesagt nein ich möchte nur mein hart
Ich möchte nicht mein CSL machen.
Weil es macht nicht mein JAV plays-Scrip
Ich habe keine Lust mich mit Typ 3 zu befassen. Und am Ende hat der Beckenentwickler oder der Integrator einen großes HTML-Paket bekommen und da war alles drin. Und das erste, was er gemacht hat, war,
dieses html-Paket zerhüpfen und zerpflücken
und da draußen seine HTML
Partials zu schreiben.
Ich habe lange nachgedacht.
und immer wieder drüber nachgebrüht.
Wie kann man das zusammenbringen?
Power von typo 3
So zu Recht machen.
dass sie im Frontend für eine
acies future
oder für einen Frontendprogrammierer benutzbar ist. Das Ergebnis davon ist T3-Bild. Weil hier die Frontendentwickler im Vordergrund stehen, wurden die Verzeichen der Verzeichen
die normalen Typ 3 Entwickler eigentlich so vorhanden sind.
Wichtbar lieben in...
Private, Public
in den Ressourcen.
In den Ressourcen.
private and resource public.
Diese verzeichnen sie gut.
ausgelagert in einen extra Verzeichnis und
Ich habe darauf geachtet, dass die
Namenskonventionen
möglichst gleich geblieben sind.
Und dadurch ist es mir nicht so gut.
möglich, dass der Frontentwickler
behebeln in magensburg.
bauen kann, ohne dass ein Typ 3 braucht. Und dann kommt der Integrator und nimmt sich diese Detailen und arbeitet sich so um, dass sie im Typ 3 brauchbar sind.
Und dann gibt es noch die große Hoffnung, dass der Frontenentwickler irgendwann dazu übergeht und direkt Fluid Templates schreibt.
Das ist Zukunftsmusik. Da darauf warten wir noch.
bis dahin möchte ich euch zeigen.
wie es möglich ist, dass
beide Entwickler zusammen in einem Paket arbeiten.
an den gleichen Dateien und dass man zu einem schnellen, guten Typ 3 Fronten kommt.
Als erstes möchte ich noch mal auf die verzeichneten Strukturen eingeben.
Wir haben hier auf der
der einen Seite das bekannte
Package Verzeichnis
wie wir es in fast jedem Typokreisystem haben.
und das mit Composer.
Auf der anderen Seite haben wir hier ein SOS Verzeichnis, in diesem SRC Verzeichnis finden wir genau das gleiche Verzeichnis wie in dem Package Verzeichnis.
Das hat einfach den Hintergrund, dass
Jedes Verzeihungspiel
dass es hier gibt, versuch das T3-Bild im Packageverzeichnis wiederzufinden.
und im Zweifelsfall die Ressourcen
und die HTML
die wir dann in das Package verzeichnet rein kopiert und der große Punkt, der große Benefit, den wir haben im T3
Bild ist, dass am Ende, wenn der Kupailprozess
ist es ein original Fluid Templates. Da ist nichts außen rum, es ist kein, ja was kript außen rum, man braucht keinen Loader dafür, es ist kein Future Soder Reakt, es ist echtes
das auf der Serverseite gerendet werden kann und das in ganz normaler
Antipot 3 zum Einsatz kommt.
Wir haben also hier
Hier im Detail den Assetsordner.
In dem Essetsordner finden sich zwei.
Beiverzeichnisse, nämlich Private und Private.
Publik und alles was ich hier
die diesem Ordner befindet.
wird 1 zu 1 in dieses Package reinkopiert.
so wie es ist, da gibt es ein Watcher, sobald hier eine Datei entsteht wird darüber kopiert und sobald hier eine Datei gelöscht wird, wird es auch im Package wieder gelöscht. Das hat ganz einfach den Grund, dass wir
dass die Git ignore-Datail möglich ist.
übersichtlich halten wollen.
jetzt natürlich sagen okay wir wollen in unserem private verzeichnissen wollen wir die language datan die wollen wir im private verzeichnissen halten im package oder wir wollen bestimmte fonts im public
in Git-Versionieren.
Dann kommen wir zu sehr komplexen.
Kitignoregeln.
Abgesehen davon hat man
immer wieder das Problem, dass man zwischen den
zwei Packages hin und her springt und unter Umständen nicht weit
in welchem man sich gerade befindet.
Dann tun wir weiß die falschen
der Teilen bearbeitet.
Deswegen haben wir grundsätzlich gesagt,
sagt, wir machen nichts und niemals irgendetwas.
einer Arbeit im Ressourcesorten
sondern das haben wir alles ausgelaufen.
und deswegen gibt es hier diesen F-Mail.
In dem können wir statische Assets ablegen.
und die werden on demand.
während dem Entwicklungsprozess
so lange der Watcher läuft im
aktuell gehalten.
Als nächstes haben wir...
Ein Inkludsverzeichnis, da können wir kleine HTML Snippets ablegen.
und Sachen die wir...
irgendwie später mal vielleicht
Per Include oder per Module.
rein ziehen können.
Wollen dann haben wir
Ja, was kriptordne
Wir haben einen SCSS-Ortener und wir haben einen
haben einen HTML-UNG.
Im HTML Ordner ist die Magic, die der Typ 3 und der Fluid Entwickler sucht. Dort sind nämlich die Templates abgelegt, die durch den Compile Prozess
laufen und dann
in das Package rein.
eingeladen werden, reinkopiert.
Im Detail erkläre ich später noch. Aber wir wollen noch mal zurückkommen. Im Fokus steht der Frontenentwickler. Wir wollen hier möglichst schnell
Ein Design in ein HTML umwandeln und vom HTML
3 kommen ohne Pause ohne Unterbrechung ohne dass sich die Fronten entwickeln mit den Integratoren streiten ohne dass der Integrator irgendwann mal sagen muss ich brauche hier noch ein Ja was krebt kannst mir das mal machen
Ich weiß ja auch gar nicht wie dein Bildprozess ist, sondern wir haben hier
alles in dem einen System.
eben drin und ich
Hier kann...
der Integrator
die ja was kryptateien an passen wenn sein muss und wenn der
Frontenentwickler sieht der integrierte
und macht hier Mist, dann kann er dem auf die
Finger klopfen und kann ihm sagen,
Bitte mag das HTML richtig, so macht man es richtig.
Wir haben also hier ein Verzeichnis, das heißt Standalone. Und in diesem Verzeichnis sollte sich der Frontenentwickler eine Datei anlegen, die heißt IndexHTML.
Und diese Index Html ist der Startpunkt für seine

