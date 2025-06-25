//
//  Tickets.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 18.09.24.
//
import Foundation

/*
 MARK: 1.1 Projekt Anlegen #312 (Mindestanforderung)
 Art Museum App
 In dieser Woche wirst du eine kleine App programmieren, die eine digitale Kunstausstellung mit Hilfe der MET (Metropolitan Museum of Art) API simuliert. Die App soll nach dem MVVM-Muster (Model-View-ViewModel) entwickelt werden. Sie soll es ermöglichen, Kunstwerke anzuzeigen und Informationen zu den ausgestellten Werken abzurufen.
 
 1. Projekt erstellen
 Erstelle wie gewohnt ein neues Xcode-Projekt. Wähle die entsprechenden Optionen: Swift und SwiftUI.

 2. Projekt Anpassungen
 Entferne alle Plattformen außer "iPhone".
 Passe die Deployment-Infos für die minimal unterstützte iOS-Version an, sodass die App iOS 17.0 benötigt.
 Erlaube die App nur im Portrait Modus
 3. ContentView löschen
 Lösche die Datei ContentView.swift.
 Entferne alle Referenzen zu ContentView aus dem Projekt, inklusive der Einträge in App.
 4. Ordnerstruktur anlegen
 Erstelle die folgenden Gruppen in deinem Projekt:

 Views
 Models
 ViewModels
 5. Projekt initialisieren
 Starte Xcode und überprüfe, ob das Projekt erfolgreich erstellt wurde und ausgeführt werden kann.
 */

/*
MARK: 1.2 API Call #313 (Mindestanforderung)
 1. API des MET Museums erkunden
 Mach dich mit der API des MET Museums (https://metmuseum.github.io/) vertraut, um herauszufinden, welche Endpunkte und Informationen benötigt werden, um Bild, Titel und Künstlername abzurufen.

 Im weiteren Verlauf nutze bitte folgenden Endpunkt, um wunderschöne Kunstwerke von Sonnenblumen zu laden:

 https://collectionapi.metmuseum.org/public/collection/v1/search?isHighlight=true&q=sunflowers
 Den Parameter sunflowers darfst du natürlich gerne ändern.

 2. Models erstellen
 Um die Daten aus der API in unserem Code nutzen zu können, brauchen wir die entsprechenden Models. Nutze dazu Postman, um zu schauen, welche Antwort zu von der API bekommst, dass du die korrekten Models erstellen kannst.

 Wichtig:
 Die API benötigt die Abfrage von zwei verschiedenen Endpunkten (bei der URL oben bekommt man lediglich eine Liste aus IDs). Kopiere eine der IDs und füge sie in diese URL bei Postman ein:

 https://collectionapi.metmuseum.org/public/collection/v1/objects/\(objectId)
 Hier bekommst du eine zweite Antwort, auch dafür brauchst du ein Model. Nenne das erste Model für die Suche ArtObjectResponse und das zweite Model für die Ergebnisse ArtObject.

 Versuche es unbedingt alleine. Falls du aber nicht weiterkommst, kannst du dir hier die benötigten Models anschauen.

 Models
 3. API-Aufruf integrieren
 Durch die Nutzung von ViewModels werden API-Aufrufe nun nicht mehr in der View gemacht, sondern im ViewModel. Überlege dir, wie die Umsetzung davon sein könnte, diese ist nämlich genauso wie beim Aufruf einer normalen Funktion und der API-Aufruf bleibt ebenfalls so wie in der View (Stichwort Refactoring)

 Da der API-Aufruf aus zwei verschiedenen Endpunkten besteht, kannst du dich heute entscheiden, ob du es selbst versuchen möchtest oder du den vorgegeben Code nutzt. Dieser wird ins ViewModel kopiert.
 */

/*
 MARK: 1.3 ArtListView erstellen #314 (Mindestanforderung)
 1. ArtListView erstellen
 Erstelle eine Datei namens ArtListView, welche später dazu dient, die aus der API geladenen Kunstwerke anzuzeigen.

 2. ViewModel als StateObject einbinden
 Integriere das ArtViewModel in die ArtListView, indem du es als @StateObject deklarierst. Das ViewModel wird verwendet, um die Kunstwerke von der API abzurufen und den Zustand der Ansicht zu verwalten.

 3. API-Aufruf beim Laden der View ausführen
 Verwende die .task-Methode, um beim Laden der ArtListView einen API-Aufruf über das ViewModel auszuführen.

 4. Benutzeroberfläche der ArtListView erstellen
 Erstelle eine List in der ArtListView, um die abgerufenen Kunstwerke anzuzeigen. Jedes Element in der Liste sollte mindestens folgende Informationen anzeigen:

 Titel des Kunstwerks
 Name des Künstlers
 Vorschaubild (falls vorhanden)
 Beispiel
 */

/*
 MARK: 2.1 DetailView hinzufügen #317 (Mindestanforderung)
 1. Navigation zur Detailansicht einrichten
 Integriere in der ArtListView eine Navigation, die es ermöglicht, beim Klicken auf ein Kunstwerk zur Detailansicht (ArtDetailView) zu gelangen.
 Verwende NavigationLink, um die Navigation zu realisieren, und stelle sicher, dass die ArtListView in einer NavigationStack eingebettet ist.
 2. Daten an die ArtDetailView übergeben
 Sorge dafür, dass die relevanten Daten des ausgewählten Kunstwerks (Titel, Künstlername, Vorschaubild, Beschreibung) korrekt an die ArtDetailView übergeben werden.
 3. Benutzeroberfläche der ArtDetailView erstellen
 Gestalte die ArtDetailView, um die folgenden Informationen über das Kunstwerk anzuzeigen:
 Vorschaubild: Zeige das Bild des Kunstwerks in großer Darstellung an.
 Titel des Kunstwerks: Zeige den Namen des Kunstwerks prominent an.
 Künstlername: Zeige den Namen des Künstlers gut sichtbar an.
 Beschreibung: Zeige die Beschreibung des Kunstwerks an, falls verfügbar.
 */

/*
 MARK: 2.2 FavoritenView vorbereiten #318 (Mindestanforderung)
 1. FavoritenView erstellen
 Erstelle eine neue SwiftUI-View Datei namens FavoritesView.swift. Diese View wird später verwendet, um die als Favoriten markierten Kunstwerke anzuzeigen.
 2. Grundlegendes Layout der FavoritenView einrichten
 Richte in der FavoritesView ein grundlegendes Layout ein, das eine Liste (List) enthält. Diese Liste wird später die favorisierten Kunstwerke anzeigen.
 Füge einen Platzhaltertext wie "Noch keine Favoriten vorhanden" ein, der angezeigt wird, wenn die Favoritenliste leer ist.
 3. TabView einrichten und FavoritenView integrieren
 Öffne die Hauptdatei der App und füge eine TabView hinzu, die es dem Benutzer ermöglicht, zwischen verschiedenen Ansichten zu wechseln.
 Integriere die FavoritesView als einen der Tabs in der TabView.
 Verwende ein Herzsymbol (z.B. heart.fill) und das Label "Favoriten" für das Tab-Item der FavoritesView.
 Stelle sicher, dass die ArtListView ebenfalls ein Tab-Item in der TabView bleibt.
 4. Navigation zur FavoritenView testen
 Führe die App aus und teste, ob du über die TabView problemlos zwischen der ArtListView und der FavoritesView wechseln kannst.
 Überprüfe, ob die FavoritesView korrekt angezeigt wird und der Platzhaltertext sichtbar ist.
 */

/*
 MARK: 2.3 Favoriten Funktionalität bauen #319 (Mindestanforderung)
 1. ViewModel anpassen
 Passe dein bestehendes ViewModel an:

 Füge eine @Published-Variable hinzu, die eine Liste der favorisierten Kunstwerke ([ArtObject]) speichert.
 Implementiere Methoden, um ein Kunstwerk als Favorit zu markieren und um festzustellen, ob ein Kunstwerk bereits als Favorit markiert ist.
 Füge eine Methode hinzu, die es ermöglicht, ein Kunstwerk aus der Favoritenliste zu entfernen.
 2. Implementierung anpassen
 Die Verwendung des ViewModels soll so geändert werden, dass es aus dem Environment abgerufen wird:

 Füge in der Hauptdatei der App (ArtMuseumApp.swift) das ViewModel als @StateObject hinzu und übergebe es als environmentObject an alle relevanten Views (ArtListView, ArtDetailView, FavoritesView).
 Kommentiere die bisherige Verwendung des ViewModels aus.
 3. Favoritenmarkierung in der Detailansicht implementieren
 Öffne die ArtDetailView und füge eine Schaltfläche hinzu, die es ermöglicht, das aktuelle Kunstwerk als Favorit zu markieren oder aus den Favoriten zu entfernen.
 Verwende ein Herzsymbol (heart oder heart.fill), um den Favoritenstatus anzuzeigen.
 Nutze das ViewModel, um das Kunstwerk zu den Favoriten hinzuzufügen oder es daraus zu entfernen, wenn der Benutzer auf die Schaltfläche klickt.
 4. Anzeige der Favoriten in der FavoritesView
 Öffne die FavoritesView und implementiere die Anzeige der favorisierten Kunstwerke.
 Verwende eine `List, um die in dem ViewModel gespeicherten Favoriten anzuzeigen.
 Stelle sicher, dass jedes Kunstwerk in der Liste mit Titel, Künstlername und Vorschaubild angezeigt wird.
 Implementiere die Navigation von der FavoritesView zur ArtDetailView, sodass der Benutzer ein Kunstwerk in den Favoriten auswählen kann, um es genauer anzusehen.
 */

/*
 MARK: 2.4 DetaiView erweitern #320 (Weiterführend)
 1. Zusätzliche Felder in der ArtObject-Struktur hinzufügen
 Erweitere die ArtObject-Struktur, um zusätzliche Informationen über das Kunstwerk zu speichern.
 Beispiele für zusätzliche Felder könnten sein:
 Entstehungsjahr (z.B. creationYear)
 Kunststil/Epoche (z.B. artStyle)
 Materialien (z.B. materials)
 Aktueller Standort (z.B. currentLocation)
 Kulturelle Herkunft (z.B. culture)
 Stelle sicher, dass die neuen Felder korrekt mit den API-Response-Feldern verknüpft werden.
 2. API-Abfragen anpassen
 Passe die API-Abfragen in der ArtRepository-Klasse an, um die neuen Informationen abzurufen.
 Stelle sicher, dass die zusätzlichen Daten in den API-Responses enthalten sind und korrekt dekodiert werden.
 3. Anzeige in der ArtDetailView erweitern
 Öffne die ArtDetailView und füge neue Abschnitte hinzu, um die zusätzlichen Informationen anzuzeigen.
 Verwende Text-Elemente oder andere passende SwiftUI-Komponenten, um die neuen Daten ansprechend darzustellen.
 Strukturiere die Ansicht so, dass die Informationen klar und übersichtlich präsentiert werden, z.B. durch die Verwendung von VStack und Divider.
 */

/*
 MARK: 3.1 Terminliste erstellen #321 (Weiterführend)
 1. Terminliste erstellen
 Über die App sollen Besuchstermine für das Museum gebucht werden können.

 Erstelle eine neue SwiftUI-View Datei namens AppointmentsView.swift. Diese View wird später verwendet, um deine bisherigen Termine anzuzeigen.
 2. Grundlegendes Layout der Terminliste einrichten
 Richte in der Terminliste ein grundlegendes Layout ein, das eine Liste (List oder ScrollView) enthält. Diese Liste wird später deine Termine anzeigen.
 In Ticket 4.2 wirst du ein Model mit zwei Properties für jeden Termin anlegen. Du kannst entweder direkt dort schauen, welche Eigenschaften das sind, um dein UI dementsprechend zu gestalten oder du arbeitest mit einem provisorischen Layout und passt dieses später an.
 Füge einen Platzhaltertext wie "Buche jetzt deinen ersten Termin!" ein, der angezeigt wird, wenn die Liste leer ist.
 3. Terminliste in TabView integrieren
 Gehe zu diner TabView und füge einen neuen Tab für die Termine hinzu. Das Icon kannst du selbst bestimmen, hier eignet sich bspw. ein Kalender.
 Integriere die AppointmentsView.swift  als zugehörigen Tab.
 */

/*
 MARK: 3.2 Model & ViewModel erstellen #322 (Weiterführend)
 1. Model für Termin erstellen
 Erstelle ein neues Model und nenne es Appointment.swift.
 Gebe dem Model eine mit einem Standardwert als UUID.
 Füge folgende Properties hinzu:
 Datum
 Anzahl Besucher:innen
 2. ViewModel erstellen
 Erstelle ein neues ViewModel namens AppointmentsViewModel.swift.
 Füge eine Variable hinzu, welche einen Array aus Terminen (Appointment) beinhaltet und zu Beginn leer ist.
 Dieser Array soll später mit deinem View kommunizieren können.
 3. Funktion zum Erstellen hinzufügen
 Erstelle eine Funktion innerhalb deines ViewModels, welche einen neuen Termin zu deinem Array hinzufügt.
 Die Funktion soll das Datum und die Anzahl der Besucher:innen als Parameter bekommen.
 4. ViewModel initialisieren
 Gehe zu deinem AppointmentsView und initialisiere dein gerade erstelltes ViewModel.
 Überlege dir, ob du dazu StateObject, ObservedObject oder EnvironmentObject nutzen musst.
 5. Termine in der View anzeigen
 Nutze die Variable mit den Terminen aus deinem ViewModel und zeige sie in deiner Liste an.
 */

/*
 MARK: 3.3 Sheet für neuen Termin #323 (Weiterführend)
 1. Sheet erstellen
 Erstelle eine neue View und nenne diese AppointmentAddView.swift.
 Als Layout kannst du ein einfaches Form nutzen mit folgenden Eingaben:
 Ein DatePicker, um das Datum des Termins festzulegen.
 Ein Stepper, um die Anzahl der Besucher:innen festzulegen.
 Ein Button, um den Termin zu speichern (erstmal ohne Funktion).
 Tipp: Für den DatePicker und den Stepper brauchst du @State?-Variablen in deinem Sheet.

 2. Sheet anzeigen
 Erstelle in deiner AppointmentsView.swift einen Button (z.B. in der Toolbar), um das Sheet zu triggern.
 Nutze den .sheet-Modifier, um AppointmentAddView innerhalb eines Sheets anzuzeigen.
 3. ViewModel übergeben
 Übergib das ViewModel aus deiner AppointmentAddView.swift in dein Sheet.
 Überlege dir dazu, ob das mit einem StateObject, ObservedObject oder EnvironmentObject machst.
 4. Termin speichern
 Gib deinem Button die Funktion aus dem ViewModel, dass ein neuer Termin mit dem korrekten Datum und der richtigen Anzahl gespeichert wird.
 Schließe das Sheet nach dem Speichern automatisch.
 */

/*
 MARK: 3.4 ViewModel für Sheet #324 (Bonus)
 Da die Nutzung von ViewModels auf den jeweiligen Views basiert, kann auch ein separates ViewModel ausschließlich für die AppointmentAddView.swift erstellt werden. Dieses kann die bisherigen @State-Variablen beinhalten.

 Hinweis: In dieser App wird nicht mit einer Datenbank wie z.B. Firebase gearbeitet, deswegen muss ein neuer Termin trotzdem im ViewModel deiner Liste gespeichert werden.
 */

/*
 MARK: 4.1 Souvenir Shop #325
 Souvenir Model
 In der Art Museum App soll ein Online Museumsshop angezeigt werden, wo Souvenirs für das Museum gekauft werden können.

 Erstelle eine Datei für das Model. Den Code für das Model kannst du hier entnehmen:
 struct Souvenir: Identifiable {
     let id: UUID = UUID()
     let name: String
     let description: String
     let price: Double
 }
 Souvenir ViewModel
 Um die Logik und die Daten der View zu verwalten, brauchen wir ein ViewModel für die View.

 Erstelle das ViewModel namens SouvenirViewModel.
 Füge dieses Array aus Souvenirs ein:
 [
     Souvenir(name: "Magnet", description: "Ein Magnet mit Museumslogo.", price: 5.99),
     Souvenir(name: "Tasse", description: "Eine Tasse mit dem Museumsdesign.", price: 12.99),
     Souvenir(name: "Schlüsselanhänger", description: "Ein eleganter Schlüsselanhänger.", price: 4.99),
     Souvenir(name: "Postkarte", description: "Postkarte mit historischen Motiven.", price: 1.99),
     Souvenir(name: "Notizbuch", description: "Ein handliches Notizbuch.", price: 8.99),
     Souvenir(name: "T-Shirt", description: "T-Shirt mit Museumsaufdruck.", price: 19.99),
     Souvenir(name: "Kunstbuch", description: "Ein Buch über die Kunstwerke im Museum.", price: 25.99),
     Souvenir(name: "Kugelschreiber", description: "Ein Kugelschreiber mit Museumslogo.", price: 3.49),
     Souvenir(name: "Poster", description: "Poster mit berühmtem Gemälde.", price: 9.99),
     Souvenir(name: "Keramikfigur", description: "Eine handgefertigte Keramikfigur.", price: 29.99),
     Souvenir(name: "Hut", description: "Ein stilvoller Hut mit Museumslogo.", price: 14.99),
     Souvenir(name: "Tasche", description: "Eine Stofftasche mit Museumsdesign.", price: 10.99),
     Souvenir(name: "Anstecknadel", description: "Eine dekorative Anstecknadel.", price: 2.49),
     Souvenir(name: "Wasserflasche", description: "Eine wiederverwendbare Wasserflasche.", price: 15.99),
     Souvenir(name: "Puzzle", description: "Ein Puzzle mit historischem Motiv.", price: 13.99)
 ]
 */

/*
 MARK: 4.2 Einkaufswager #326
 Funktionalität
 Um Souvenirs kaufen zu können, braucht es einen virtuellen Einkaufswagen.

 Ergänze das ViewModel um ein Array, in dem die Souvenirs des Einkaufswagens gespeichert werden sollen
 Ergänze das ViewModel um Funktionen, mit denen man neue Items in das Array hinzufügen und entfernen kann
 In der SouvenirShopView: Wenn auf den Button eines Listeneintrags geklickt wird, soll das Souvenir in den Einkaufswagen hinzugefügt werden
 Einkaufswagen View
 Zeige den Einkaufswagen an. Wie genau du ihn anzeigst, ist dir freigestellt.

 Erstelle z.B: eine CartView und zeige sie in einem Sheet an
 Zeige im Einkaufswagen alle Souvenirs, die im ViewModel für den Einkaufswagen gespeichert sind, in einer Liste an.
 Die Souvenirs sollen auch aus dem Einkaufswagen entfernt werden können. Implementiere dies z.B. mit einer SwipeAction
 */
