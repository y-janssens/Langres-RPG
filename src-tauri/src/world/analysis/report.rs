use serde::{Deserialize, Serialize};
use std::{collections::HashMap, hash::Hash, io::Error};
use strum_macros::{Display, EnumString};

use crate::world::builder::{
    config::{Conf, Values},
    constraints::Constraints,
    settings::EMPTY,
};
use crate::world::models::{Item, Options};

use super::distribution::Distribution;

#[derive(Debug, Serialize, Deserialize, Clone, Copy, Hash, Eq, PartialEq, Display, EnumString)]
#[strum(serialize_all = "snake_case")]
pub enum MapReportEntry {
    Valid,
    Invalid,
    Inconsistent,
    Unchanged,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct MapReport {
    pub summary: HashMap<MapReportEntry, u32>,
    pub details: HashMap<MapReportEntry, Vec<u32>>,
    pub distribution: Distribution,
}

impl Default for MapReport {
    fn default() -> Self {
        Self::new()
    }
}

impl MapReport {
    pub fn new() -> Self {
        Self {
            summary: HashMap::from([
                (MapReportEntry::Valid, 0),
                (MapReportEntry::Invalid, 0),
                (MapReportEntry::Inconsistent, 0),
                (MapReportEntry::Unchanged, 0),
            ]),
            details: HashMap::from([
                (MapReportEntry::Invalid, Vec::new()),
                (MapReportEntry::Inconsistent, Vec::new()),
                (MapReportEntry::Unchanged, Vec::new()),
            ]),
            distribution: Distribution::new(),
        }
    }

    pub fn generate(&mut self, items: &[Item], options: &Options) -> Result<Self, Error> {
        let settings = Conf::get_config(&options.r#type);
        let expected_values = Values::get_tiles_values();

        for item in items.iter() {
            let neighbours = item.get_neighbours_values(items);
            let constraints = Constraints::apply(neighbours, &settings);

            self.parse_entries(item, constraints, &expected_values)?;
        }
        self.distribution = Distribution::new().analyze(items);
        Ok(self.clone())
    }

    fn parse_entries(
        &mut self,
        item: &Item,
        constraints: (HashMap<String, u32>, Vec<String>),
        expected_values: &[String],
    ) -> Result<(), Error> {
        if item.value == EMPTY.clone().value() {
            self.parse_entry(MapReportEntry::Unchanged, item, true)
        } else if !constraints.1.is_empty() {
            if expected_values.contains(&item.value) {
                self.parse_entry(MapReportEntry::Valid, item, false)
            } else {
                self.parse_entry(MapReportEntry::Invalid, item, true)
            }
        } else {
            self.parse_entry(MapReportEntry::Inconsistent, item, true)
        }
    }

    fn parse_entry(
        &mut self,
        category: MapReportEntry,
        item: &Item,
        parse_details: bool,
    ) -> Result<(), Error> {
        self.increment_summary(category)?;
        if parse_details {
            self.append_details(category, item.id)?;
        }
        Ok(())
    }

    fn increment_summary(&mut self, category: MapReportEntry) -> Result<(), Error> {
        self.summary.entry(category).and_modify(|count| *count += 1);
        Ok(())
    }

    fn append_details(&mut self, category: MapReportEntry, item_id: u32) -> Result<(), Error> {
        self.details
            .entry(category)
            .and_modify(|values| values.push(item_id));
        Ok(())
    }
}
