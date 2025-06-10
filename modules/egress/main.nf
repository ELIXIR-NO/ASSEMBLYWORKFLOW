process egress_ASSEMBLYPIPELINE {
	debug params.debug
	label 'egress_ASSEMBLYPIPELINE'	
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries
    	input:
		path(egressIN) //the contigs
	output:		
		path "*_contigs.fasta", includeInputs:true, emit: egress_ASSEMBLYPIPELINE_OUT
	when:
		true
	script:			
		egressPath = params.egresspath
		egressOUT = params.egresspath + egressIN
		template 'egress_ASSEMBLYPIPELINE.sh'
}