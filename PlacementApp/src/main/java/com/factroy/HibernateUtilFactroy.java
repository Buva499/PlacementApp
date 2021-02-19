package com.factroy;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtilFactroy {
	public static SessionFactory sf;
	
	public static SessionFactory getFactory() {
		if(sf==null) {
			sf = new Configuration().configure().buildSessionFactory();
		}
		return sf;
	}
	public static void close() {
		if(sf!=null) {
			sf.close();
		}
	}
}
