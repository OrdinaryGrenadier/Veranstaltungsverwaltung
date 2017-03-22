package de.jee.veranstaltungsverwaltung.view;

import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;

import de.jee.veranstaltungsverwaltung.controller.Security;
import de.jee.veranstaltungsverwaltung.model.Veranstaltung;
import de.jee.veranstaltungsverwaltung.model.VeranstaltungDAO;

@Named
@RequestScoped
public class VeranstaltungRequest {
	@Inject
	private Security security;
	private String name;
	private String beschreibung;
	private Date datum;
	private String ort;
	private int anzahlTickets;
	private boolean istVeroeffentlicht;
	
	public String erstelleVeranstaltung(){
		if(beschreibung == null)
			beschreibung = "";
		VeranstaltungDAO dao = new VeranstaltungDAO();
		Veranstaltung veranstaltung = new Veranstaltung(name, beschreibung, datum, ort, istVeroeffentlicht, security.getCurrentUser());
		int returncode = dao.save(veranstaltung, anzahlTickets);
		if(returncode <= 1)
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Die Veranstaltung wurde erfolgreich angelegt", null));
		else
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Die Veranstaltung konnte nicht angelegt werden", null));		
		return "neue_veranstaltung";
	}

	public Security getSecurity() {
		return security;
	}

	public void setSecurity(Security security) {
		this.security = security;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBeschreibung() {
		return beschreibung;
	}

	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}

	public Date getDatum() {
		return datum;
	}

	public void setDatum(Date datum) {
		this.datum = datum;
	}

	public String getOrt() {
		return ort;
	}

	public void setOrt(String ort) {
		this.ort = ort;
	}

	public boolean isIstVeroeffentlicht() {
		return istVeroeffentlicht;
	}

	public void setIstVeroeffentlicht(boolean istVeroeffentlicht) {
		this.istVeroeffentlicht = istVeroeffentlicht;
	}

	public int getAnzahlTickets() {
		return anzahlTickets;
	}

	public void setAnzahlTickets(int anzahlTickets) {
		this.anzahlTickets = anzahlTickets;
	}
}