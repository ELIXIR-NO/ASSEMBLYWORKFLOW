process spades {
	debug params.debug
	label 'spades'
	conda './modules/spades/environments/spades_4.0.0.yaml'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries
	input:
		tuple path(spadesIN1), path(spadesIN2)
	output:
		path "*_contigs.fasta", emit: spadesOUT
	when:
		true
	script:	
		egressPath = params.egresspath
		spadesThreads = params.defaultcpus
		spadesOUT = "spades_" + spadesIN1.getBaseName().substring(0, spadesIN1.getBaseName().lastIndexOf('_1'))
		spades_contigsFilename = spadesIN1.getBaseName().substring(0, spadesIN1.getBaseName().lastIndexOf('_1')) + "_contigs.fasta"
		template 'spades.sh'
}

process spades_meta {
	debug params.debug
	label 'spades'
	conda './modules/spades/environments/spades_4.0.0.yaml'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries
	input:
		tuple path(spadesIN1), path(spadesIN2)
	output:
		path "*_contigs.fasta", emit: spadesOUT
	when:
		true
	script:	
		egressPath = params.egresspath
		spadesThreads = params.defaultcpus
		spadesOUT = "spades_" + spadesIN1.getBaseName().substring(0, spadesIN1.getBaseName().lastIndexOf('_1'))
		spades_contigsFilename = spadesIN1.getBaseName().substring(0, spadesIN1.getBaseName().lastIndexOf('_1')) + "_contigs.fasta"
		template 'spades_meta.sh'
}
