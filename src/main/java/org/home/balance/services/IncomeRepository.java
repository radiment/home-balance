package org.home.balance.services;

import org.home.balance.entities.Income;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * @author Andrey Dyomin created 20.03.17.
 */
@RepositoryRestResource(collectionResourceRel = "income", path = "income")
public interface IncomeRepository extends PagingAndSortingRepository<Income, Long> {
}
