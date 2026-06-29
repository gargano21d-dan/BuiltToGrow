package model;

import java.util.ArrayList;
import java.util.List;

public class Carrello {

	private List<CarrelloItem> items = new ArrayList<>();

	public List<CarrelloItem> getItems() {
		return items;
	}

	public void aggiungi(ProdottoBean prodotto) {
		for (CarrelloItem item : items) {
			if (item.getProdotto().getId() == prodotto.getId()) {
				item.setQuantita(item.getQuantita() + 1);
				return;
			}
		}
		items.add(new CarrelloItem(prodotto, 1));
	}

	public void rimuovi(int prodottoId) {
		items.removeIf(item -> item.getProdotto().getId() == prodottoId);
	}

	public double getTotale() {
		double totale = 0;
		for (CarrelloItem item : items) {
			totale += item.getSubtotale();
		}
		return totale;
	}

	public boolean isVuoto() {
		return items.isEmpty();
	}
}
