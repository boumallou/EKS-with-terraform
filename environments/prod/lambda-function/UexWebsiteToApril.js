'use strict';
const querystring = require('querystring');
const urlL = require('url');

exports.handler = (event, context, callback) => {
    const request = event.Records[0].cf.request;
    const headers = request.headers;
    const user_agent = headers['user-agent'];
    const host = headers['host'];

    const url = event['Records'][0].cf.request.uri
    const params = querystring.parse(request.querystring);
    let url_redirect_april = 'https://april-international.com';
    let found = null
    
    if (url.match(new RegExp("/en-sg/blog/lifestyle/the-10-most-unusual-rules-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/vaccination/how-much-do-vaccines-cost-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/hospitals/list-of-hospitals-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/useful-tips/2022-working-in-singapore-as-a-dependents-pass-holder", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/vaccination/vaccination-requirements-for-my-childs-dependent-pass", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-are-vaccination-requirements-my-child-s-dependent-pass-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/the-cost-of-giving-birth-for-expats-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/five-things-you-should-know-about-maternity-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/lifestyle/top-10-des-regles-insolites-a-connaitre-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/conseils-utiles/8-conseils-pour-bien-preparer-un-long-vol-avec-des-enfants", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/healthcare-system/how-to-choose-your-doctor-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/healthcare-system/choose-public-and-private-hospitals-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-difference-between-private-and-public-health-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/vaccination/how-do-i-get-the-covid-19-vaccine-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/healthcare-system/list-of-expat-friendly-doctors-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/conseils-utiles/6-reflexes-a-avoir-avant-de-s-installer-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/employee-benefits/mandatory-employee-insurance-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/corporate/international-health-plans-for-companies";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/log-how-to-avoid-paying-for-your-hospitalization", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/conseils-utiles/voyage-liste-des-vaccins-en-asie-du-sud-est", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/covid-19-where-to-be-tested-how-much-does-it-costs-how-am-i-covered", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/systeme-de-sante/liste-des-docteurs-expat-friendly-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/type-of-hospital-bedrooms-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-difference-between-private-and-public-health-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/hospitals/mount-elizabeth-hospital-opens-its-doors-to-you", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-difference-between-private-and-public-health-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/5-best-health-insurance-options-for-expats-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/health-insurance-guide-for-permanent-residents", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/lifestyle/chinese-new-year-what-traditions-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/traditional-chinese-medicine-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/mode-de-vie/nouvel-an-chinois-quelles-traditions-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/traditional-chinese-medicine-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/useful-tips/employment-pass-and-s-pass-government-raising-the-minimum-wage", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/healthcare-system/price-hospitalization-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-difference-between-private-and-public-health-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/lifestyle/6-ways-to-enjoy-sport-for-free-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/healthcare-system/which-asian-countries-have-the-best-healthcare", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/sante/moustiques-a-singapour-quels-virus-surveiller", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/men-and-mental-health-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/hospitals/singapore-general-hospital-opens-its-doors-to-you", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-difference-between-private-and-public-health-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/what-to-do-with-my-health-insurance-during-a-transition-period", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/assurance-sante/qu-est-ce-que-la-franchise-annuelle-et-le-co-paiement", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/dengue-in-singapore-advice-by-dr-leong-hoe-nam-specialist-in-infectious-diseases", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/useful-tips/singapore-emergency-contacts", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/the-costs-of-breast-cancer-treatment-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/health-insurance-from-australian-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/hospitals/select-the-hospital-that-best-suits-your-needs", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-difference-between-private-and-public-health-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/conseils-utiles/les-types-de-visas-a-singapour-et-comment-les-obtenir", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/why-do-health-insurance-premiums-increase-every-year", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/5-reasons-why-healthcare-so-expensive-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/the-maternity-coverage-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/five-things-you-should-know-about-maternity-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/systeme-de-sante/palmares-des-pays-asiatiques-aux-meilleurs-systemes-de-sante", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/hospitals/kk-womens-and-childrens-hospital-opens-its-doors-to-you", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-difference-between-private-and-public-health-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/vaccination/children-vaccination-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/medical-underwriting-and-pre-existing-conditions", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/hospitals/gleneagles-hospital-opens-its-doors-to-you", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-difference-between-private-and-public-health-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/hopitaux/liste-des-hopitaux-de-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/your-overseas-vaccination-and-booster-dose-recognised-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/systeme-de-sante/ophtalmologie-a-singapour-comment-ca-marche", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/how-well-does-my-employers-health-insurance-cover-me", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/mode-de-vie/8-endroits-pour-profiter-de-la-nature-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/children/expat-in-singapore-wills-and-guardianship-letters", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/all-you-need-to-know-about-pre-existing-conditions", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/healthcare-system/dermatology-in-singapore-how-does-it-work", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/health-screenings-for-your-toddler-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/six-common-health-issues-of-expats-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/international-expat-health-insurance-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/maternity/the-maternity-coverage-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/five-things-you-should-know-about-maternity-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/mode-de-vie/fete-nationale-de-singapour-les-bons-plans", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health/mosquitoes-in-singapore-what-virus-to-be-aware-of", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance", "g"))){
    	found = true;
    	url_redirect_april = " https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/maternite/accouchement-et-maternite-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/guide/le-cout-de-la-sante-singapour";
    }
    else if (url.match(new RegExp("/fr-sg/blog/mode-de-vie/6-astuces-pour-faire-du-sport-gratuitement-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/health-insurance-for-expat-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/vaccination/la-vaccination-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/healthcare-system/5-reasons-why-healthcare-in-singapore-can-be-expensive", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/5-reasons-why-healthcare-so-expensive-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/useful-tips/what-you-need-to-know-about-work-passes-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/systeme-de-sante/dentistes-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/maternity/maternity-care-in-singapore-how-to-choose-between-public-and-private-hospitals", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/five-things-you-should-know-about-maternity-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/healthcare-system/ophthalmology-in-singapore-how-does-it-work", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/assurance-sante/assurance-sante-temporaire-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/conseils-utiles/ce-que-vous-devez-savoir-sur-les-permis-de-travail-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/pme/lancer-son-entreprise-a-singapour-en-tant-qu-expat", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/corporate/international-health-plans-for-companies";
    }
    else if (url.match(new RegExp("/en-sg/blog/guide/uex-health-guide-maternity-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/five-things-you-should-know-about-maternity-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/how-to-cover-my-newborn-from-day-1", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/sante/les-examens-de-prevention-de-sante-pour-les-hommes", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/systeme-de-sante/combien-coute-une-hospitalisation-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/guide/le-cout-de-la-sante-singapour";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/5-mistakes-when-buying-health-insurance-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/healthcare-system/dental-healthcare-in-singapore-how-does-it-work", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/about-april/news/we-ve-expanded-access-dental-care-singapore-our-members";
    }
    else if (url.match(new RegExp("/en-sg/blog/hospitals/raffles-hospital-opens-its-doors-to-you", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/what-difference-between-private-and-public-health-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog/conseils-utiles/liste-des-contacts-en-cas-d-urgence-a-singapour", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/destinations/asia-pacific/health-insurance-in-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog/health-insurance/health-insurance-during-internship-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/international-student-insurance";
    }
    else if (url.match(new RegExp("/en-sg/blog/maternity/pregnancy-and-maternity-in-singapore", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/guide/five-things-you-should-know-about-maternity-singapore";
    }
    else if (url.match(new RegExp("/en-sg/blog", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/en/long-term-international-health-insurance/myhealth-singapore";
    }
    else if (url.match(new RegExp("/fr-sg/blog", "g"))){
    	found = true;
    	url_redirect_april = "https://april-international.com/fr/assurance-expatrie/myhealth-singapore";
    }

    let queryParams = ''
    for(var key in request.querystring){
        queryParams += key + '='+ request.querystring[key] + '&';
    }

    if(queryParams != ''){
        url_redirect_april += '?' + queryParams;
    }


    const response = {
        status: '301',
        statusDescription: 'Found',
        headers: {
            location: [{
                key: 'Location',
                value: url_redirect_april,
            }],
            'cache-control': [{
                key: 'Cache-Control',
                value: 'no-cache'
            }],
        },
    };


    return callback(null, response);
};