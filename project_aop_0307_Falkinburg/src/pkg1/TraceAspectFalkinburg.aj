package pkg1;

public aspect TraceAspectFalkinburg {
	pointcut classToTrace(): within(DataApp) || within(ServiceApp) || within(ComponentApp);
	   pointcut methodToTrace():  classToTrace() &&  execution(String getName());

	   before(): methodToTrace() {
	      String info = thisJoinPointStaticPart.getSignature() + ", "
	            + thisJoinPointStaticPart.getSourceLocation().getLine();
	      System.out.println("\t-->" + info);
	   }

	   after(): methodToTrace() {
	      System.out.println("\t<--" + thisJoinPointStaticPart.getSourceLocation().getFileName());
	   }
}
