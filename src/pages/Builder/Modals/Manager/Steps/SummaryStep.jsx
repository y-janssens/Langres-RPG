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

        const initialIds = initialStory.story.acts?.map((ac) => ac.id);
        const actualIds = story.story.acts?.map((ac) => ac.id);
        const deletedIds = initialIds.filter((id) => !actualIds.includes(id));

        const deletedActs = initialStory.story.acts
            ?.filter((act) => deletedIds.includes(act.id))
            .map((act) => {
                act['deleted'] = true;
                return act;
            });

        story.story.acts = [...story.story.acts, ...deletedActs].filter((act) => act);
        return story;
    }, [initialStory, story]);

    return (
        <div className={css['manager-step-body']}>
            <div className={css['manager-summary-acts']}>
                {storyActs.story.acts
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
        return initial.story.acts.find((ac) => ac.id === act.id);
    }, [initial, act]);

    const statusHighlight = useMemo(() => {
        if (act.deleted) {
            return { status: 'Deleted', color: 'red' };
        }

        if (initial.story.acts.some((ac) => ac.id === act.id)) {
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
        const initialIds = currentAct.content?.maps?.map((mp) => mp.id);
        const actualIds = act.content.maps?.map((mp) => mp.id);
        const deletedIds = initialIds.filter((id) => !actualIds.includes(id));

        const deletedMaps = currentAct.content.maps
            ?.filter((mp) => deletedIds.includes(mp.id))
            .map((mp) => {
                mp['deleted'] = true;
                return mp;
            });

        act.content.maps = [...act.content.maps, ...deletedMaps].filter((mp) => mp);
        return act;
    }, [currentAct, act]);

    return (
        <div className={css['manager-summary-act']}>
            <span className={css['summary-act-label']} onClick={() => setOpen(!open)} style={{ color: statusHighlight.color }}>{`- ${act.name} - ${act.title}`}</span>
            {open &&
                actContent.content.maps
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
        const currentAct = story.story.acts.find((ac) => ac.id === act.id);
        const initialAct = initial.story.acts.find((ac) => ac.id === act.id);

        if (map.deleted || act.deleted) {
            return { status: 'Deleted', color: 'red' };
        }

        if (
            (!currentAct && initialAct && initialAct.content.maps.some((mp) => mp.id === map.id)) ||
            (currentAct && initialAct && !initialAct.content.maps.some((mp) => mp.id === map.id)) ||
            !initialAct
        ) {
            return { status: 'New', color: 'green' };
        }

        if (currentAct) {
            const currentMap = currentAct.content.maps?.find((mp) => mp.id === map.id);

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
