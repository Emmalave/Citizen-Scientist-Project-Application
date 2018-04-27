//
//  PreviousWinnerCollapsibleTableContentManager.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 4/18/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import Foundation

class PreviousWinnersCollapsibleTableContentManager {
    
    class func fetchTableContent() -> [PreviousWinnersTableSection] {
        
        let tableSections: [PreviousWinnersTableSection] = [
            PreviousWinnersTableSection(header: CollapsibleTableHeader(title: "PRE K - 1", arrow: "down-arrow"),
                                        rows: [
                                                PreviousWinnersTableRow(header: "SCIENCE PROJECT (PRE-K/K/1ST)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Ms. Defne’s Class (Kindergarten – KBPS)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Ms. Brooke’s Class (Pre-K4 – KBPS)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Ms. Geraldine and Ms. Natalie’s Class (Pre-K – KBCC Day School)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "BOOK (PRE-K/K/1ST)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Ms. Mary’s Class (Pre-K – KBCC Day School)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Ms. Defne’s Class (Kindergarten – KBPS)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Bennett Bahamondes, Cristina Campos, Oliver Waicman (Pre-K4 – Katie Marco, KBPS)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "COLLAGE (PRE-K/K/1ST)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Elliot Dupont-Berry, Pablo Muñoz, Henrique Castro (Kindergarten – Kim Rizio, KBPS)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Fatima Yarur, Christina Nottebohm, Felix Wolcott (Kindergarten – Kim Rizio, KBPS)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Madison London (1st – Mrs. Bencosme, K-8)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "2D DEPICTION OF WATER LIFE (PRE-K/K/1ST)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Alessandro Contreras, Marco Terc, Carla Gonzalez, Nina Reis (Pre-K3 – Ms. Marcie/Ms. Tatiana, KBCC Day School)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Daniela Reyes (1st – Ms. Bencosme, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Juan Ignacio Poleo (Kindergarten – Ms. Macia, St. Agnes)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Pablo Muñoz (Kindergarten – Kim Rizio, KBPS)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "PHOTOGRAPHY (PRE-K/K/1ST)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Rocio Giesso (1st – Ms. Bencosme, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Andrea Castro (1st – Ms. Barcelo, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Teo Ribenboim (Pre-K – Ms. Defne, KBPS)"),
                                                    ]),
                                        ]),
            
            PreviousWinnersTableSection(header: CollapsibleTableHeader(title: "2 - 3", arrow: "down-arrow"),
                                        rows: [
                                                PreviousWinnersTableRow(header: "2D DEPICTION OF WATER LIFE (2ND/3RD)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Lila Malmierca (2nd – Mrs. Magner, St. Agnes)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Camilla de Iraola (3rd – Mrs. Magner, St. Agnes)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "COLLAGE (2ND/3RD)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Carolina Quintanilla (2nd – Ms. Babani, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "2nd – Pablo Calvo (3rd – Ms. Manzieri, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Camila Bercum (2nd – Ms. Babani, K-8)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "COMIC STRIP (2ND/3RD)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Lorena Martins (3rd – Ms. Gimenez, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Andrea Velarde (2nd – Ms. Ramirez, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Sofia Acosta (3rd – Ms. Suarez, K-8)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "PHOTOGRAPHY (2ND/3RD)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Sebastian Piedra (3rd – Ms. Rodriguez/Ms. Ferreyros, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Delfina Abbondati (2nd – Ms. Ramos, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Sara Cheja (3rd – Ms. Manzieri, K-8)"),
                                                    ]),
                                        ]),
            
            PreviousWinnersTableSection(header: CollapsibleTableHeader(title: "4 - 5", arrow: "down-arrow"),
                                        rows: [
                                                PreviousWinnersTableRow(header: "SCIENCE PROJECT (4TH/5TH)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Valeria Bickford, Georgia Easton, Ariella Zecchini (4th and 5th – Jenny Acosta, St. Christopher’s)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Austin Earle (4th – Jenny Acosta, St. Christopher’s)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "2D MIXED MEDIA PAINTING (4TH/5TH)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Joaquin Gentile (4th – Ms. Albanis/Ms. Fantes, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Jazmin Campiani (4th – Ms. Albanis/Ms. Fantes, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Leticia Granados (5th – Ms. Brennan, K-8)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "2D MIXED MEDIA PAINTING (4TH/5TH) AT HOME", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "David \"Chuli\" Serra (5th – Ms. Raposo, K-8)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "PUBLIC SERVICE ANNOUNCEMENT (4TH/5TH)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Tiago Socarras (4th – Jenny Acosta, St. Christopher’s)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "PERSONAL NARRATIVE (INTERVIEW WITH “KEY RAT”) (4TH/5TH)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Angelo Perez (4th – Jenny Acosta, St. Christopher’s)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "PHOTOGRAPH (4TH/5TH)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Lucas Bernal (4th – Jenny Acosta, St. Christopher’s)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Nicolas Verdu (4th – Ms. Keif, K-8)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Allegra Simonetti (5th – Ms. Benito, K-8)"),
                                                    ]),
                                        ]),
            
            PreviousWinnersTableSection(header: CollapsibleTableHeader(title: "6 - 8", arrow: "down-arrow"),
                                        rows: [
                                                PreviousWinnersTableRow(header: "COLORING BOOKS (6TH/7TH/8TH)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Nicholas Mesa-Culcalon, Isabella Ribiero, Elizavetta Stetsenko, Marina Geilen (8th – Auril Perez, MAST)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Catalina Hirsch, Isabella Fassio, Isabella Zimmerman (8th – Auril Perez, MAST)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Grace Penza, Savannah Reed, Lucia Gil (8th – Auril Perez, MAST)"),
                                                    ]),
                                                
                                                PreviousWinnersTableRow(header: "PHOTOGRAPHY (6TH/7TH/8TH)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Benjamin Pace (8th – Auril Perez, MAST)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Second, winners: "Maria Romero (8th – Auril Perez, MAST)"),
                                                    PreviousWinners(rank: PreviousWinnersRank.Third, winners: "Valentina Orjuela (8th – Auril Perez, MAST)"),
                                                    ]),
                                        ]),
            
            PreviousWinnersTableSection(header: CollapsibleTableHeader(title: "9 - 12", arrow: "down-arrow"),
                                        rows: [
                                                PreviousWinnersTableRow(header: "SCIENCE REPORT (WRITTEN 8-10 PAGES)", winners: [
                                                    PreviousWinners(rank: PreviousWinnersRank.First, winners: "Isabella Lopez (11th – C. Walker, MAST)"),
                                                    ]),
                                        ]),
            
        ]
        
        return tableSections
    }
}
