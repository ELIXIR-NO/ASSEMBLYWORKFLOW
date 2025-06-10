process ingress_ASSEMBLYPIPELINE {	
	debug params.debug
	label 'ingress_ASSEMBLYPIPELINE'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries		
        input:
		tuple val(ingressNAME), path(ingressFILES)
	output:
		path "*.dedupe.good.tagged.filter.repaired.fastq.gz", includeInputs:true, emit: ingress_ASSEMBLYPIPELINE_OUT		
	when:
		true	
	script:		
		egressPath = params.egresspath
		
		ingressIN1 = ingressFILES[0].getName()
		ingressIN2 = ingressFILES[1].getName()

		ingressOUT1 = ingressFILES[0].getName()
		ingressOUT2 = ingressFILES[1].getName()

		template 'ingress_ASSEMBLYPIPELINE.sh'
}