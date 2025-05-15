import React, { useMemo, useState } from 'react';
import { useTranslation } from 'react-i18next';
import _ from 'lodash';

import css from '../manager.module.css';

export const SummaryStep = ({ form }) => {
    const { story, initialStory } = { ...form };

    const storyActs = useMemo(() => {
        if (_.isEqual(story, initialStory)) {
            return story;
        }

        const initialIds = initialStory.acts?.map((ac) => ac.id);
        const actualIds = story.acts?.map((ac) => ac.id);
        const deletedIds = initialIds.filter((id) => !actualIds.includes(id));

        const deletedActs = initialStory.acts
            ?.filter((act) => deletedIds.includes(act.id))
            .map((act) => {
                act['deleted'] = true;
                return act;
            });

        story.acts = [...story.acts, ...deletedActs].filter((act) => act);
        return story;
    }, [initialStory, story]);

    return (
        <div className={css['manager-step-body']}>
            <div className={css['manager-summary-acts']}>
                {storyActs.acts
                    ?.filter((act) => !act.temp)
                    .sort((a, b) => a.order - b.order)
                    .map((act) => {
                        return <StoryAct key={act.id} story={story} initial={initialStory} act={act} />;
                    })}
            </div>
        </div>
    );
};

const StoryAct = ({ story, initial, act }) => {
    const [open, setOpen] = useState(true);

    const currentAct = useMemo(() => {
        return initial.acts.find((ac) => ac.id === act.id);
    }, [initial, act]);

    const statusHighlight = useMemo(() => {
        if (act.deleted) {
            return { status: 'Deleted', color: 'red' };
        }

        if (initial.acts.some((ac) => ac.id === act.id)) {
            if (_.isEqual(currentAct, act)) {
                return { status: 'Unchanged', color: 'white' };
            } else {
                return { status: 'Modified', color: 'orange' };
            }
        } else {
            return { status: 'New', color: 'green' };
        }
    }, [currentAct, story, initial, act]);

    const actContent = useMemo(() => {
        if (_.isEqual(currentAct, act) || !currentAct) {
            return act;
        }
        const initialIds = currentAct?.maps?.map((mp) => mp.id);
        const actualIds = act.maps?.map((mp) => mp.id);
        const deletedIds = initialIds.filter((id) => !actualIds.includes(id));

        const deletedMaps = currentAct.maps
            ?.filter((mp) => deletedIds.includes(mp.id))
            .map((mp) => {
                mp['deleted'] = true;
                return mp;
            });

        act.maps = [...act.maps, ...deletedMaps].filter((mp) => mp);
        return act;
    }, [currentAct, act]);

    return (
        <div className={css['manager-summary-act']}>
            <span className={css['summary-act-label']} onClick={() => setOpen(!open)} style={{ color: statusHighlight.color }}>{`- ${act.name} - ${act.title}`}</span>
            {open &&
                actContent.maps
                    ?.filter((mp) => !mp.temp)
                    .map((mp) => {
                        return <StoryMap key={mp.id} story={story} initial={initial} map={mp} act={act} />;
                    })}
        </div>
    );
};

const StoryMap = ({ story, initial, act, map }) => {
    const { t } = useTranslation();
    const statusHighlight = useMemo(() => {
        const currentAct = story.acts.find((ac) => ac.id === act.id);
        const initialAct = initial.acts.find((ac) => ac.id === act.id);

        if (map.deleted || act.deleted) {
            return { status: 'Deleted', color: 'red' };
        }

        if (
            (!currentAct && initialAct && initialAct.maps.some((mp) => mp.id === map.id)) ||
            (currentAct && initialAct && !initialAct.maps.some((mp) => mp.id === map.id)) ||
            !initialAct
        ) {
            return { status: 'New', color: 'green' };
        }

        if (currentAct) {
            const currentMap = currentAct.maps?.find((mp) => mp.id === map.id);

            if (_.isEqual(currentMap, map)) {
                return { status: 'Unchanged', color: 'white' };
            } else {
                return { status: 'Modified', color: 'orange' };
            }
        }
    }, [story, act]);
    return (
        <span className={css['manager-summary-map']} style={{ color: statusHighlight.color }}>{`- ${t('builder.menu.map.name')}: ${map.name} - ${t('builder.menu.map.size')}: ${
            map.size
        }`}</span>
    );
};
